import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler.dart'
    show ApiErrorHandler;
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/categories_repository.dart';
import '../../domain/repositories/products_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoriesRepository _categoriesRepository;
  final ProductsRepository _productsRepository;

  HomeCubit(this._categoriesRepository, this._productsRepository)
    : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    try {
      final results = await Future.wait([
        _categoriesRepository.getCategories(),
        _productsRepository.getAllProducts(),
      ]);

      final categoriesResult = results[0] as ApiResult<List<Category>>;
      final productsResult = results[1] as ApiResult<List<Product>>;

      ApiErrorModel? error;
      List<Category>? categories;
      List<Product>? products;

      categoriesResult.when(
        success: (catData) => categories = catData,
        failure: (err) => error = err,
      );

      productsResult.when(
        success: (prodData) => products = prodData,
        failure: (err) => error ??= err,
      );

      // Emit appropriate state
      if (error != null) {
        emit(HomeFailure(error!));
      } else {
        emit(
          HomeSuccess(categories: categories ?? [], products: products ?? []),
        );
      }
    } catch (e) {
      emit(HomeFailure(ApiErrorHandler.handle(e)));
    }
  }
}
