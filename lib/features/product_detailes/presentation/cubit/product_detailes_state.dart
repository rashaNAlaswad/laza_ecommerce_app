import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/product_detailes.dart';

sealed class ProductDetailesState {
  const ProductDetailesState();
}

class ProductDetailesInitial extends ProductDetailesState {}

class ProductDetailesLoading extends ProductDetailesState {}

class ProductDetailesSuccess extends ProductDetailesState {
  final ProductDetailes productDetailes;
  const ProductDetailesSuccess(this.productDetailes);
}

class ProductDetailesFailure extends ProductDetailesState {
  final ApiErrorModel error;
  const ProductDetailesFailure(this.error);
}
