import '../../domain/entities/product_detailes.dart';
import '../models/prodect_detailes_response.dart';

class ProductDetailesMapper {
  static ProductDetailes toDomain(
    ProductDetailesResponse productDetailesResponse,
  ) {
    return ProductDetailes(
      id: productDetailesResponse.id,
      name: productDetailesResponse.name,
      coverPictureUrl: productDetailesResponse.coverPictureUrl,
      productPictures: productDetailesResponse.productPictures,
      categories: productDetailesResponse.categories,
      price: productDetailesResponse.price,
      stock: productDetailesResponse.stock,
      weight: productDetailesResponse.weight,
      color: productDetailesResponse.color,
      rating: productDetailesResponse.rating,
      reviewsCount: productDetailesResponse.reviewsCount,
      description: productDetailesResponse.description,
    );
  }
}
