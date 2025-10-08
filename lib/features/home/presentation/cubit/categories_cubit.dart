import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _categoriesRepository;
  CategoriesCubit(this._categoriesRepository) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    final result = await _categoriesRepository.getCategories();
    result.when(
      success: (categories) {
        emit(CategoriesSuccess(categories));
      },
      failure: (error) {
        emit(CategoriesFailure(error));
      },
    );
  }
}
