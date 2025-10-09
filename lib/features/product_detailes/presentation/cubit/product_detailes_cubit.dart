import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/prodect_detailes_repository.dart';
import 'product_detailes_state.dart';

class ProductDetailesCubit extends Cubit<ProductDetailesState> {
  final ProdectDetailesRepository _productDetailesRepository;
  ProductDetailesCubit(this._productDetailesRepository)
    : super(ProductDetailesInitial());

  Future<void> loadProductDetailes(String productId) async {
    emit(ProductDetailesLoading());

    final result = await _productDetailesRepository.getProductById(productId);
    result.when(
      success: (productDetailes) =>
          emit(ProductDetailesSuccess(productDetailes)),
      failure: (error) => emit(ProductDetailesFailure(error)),
    );
  }
}
