import '../../domain/entities/product.dart' as domain;
import '../models/prodect_response.dart' as data;

class ProductMapper {
  static domain.Product toDomain(data.Product productResponse) {
    return domain.Product(
      id: productResponse.id,
      name: productResponse.name,
      coverPictureUrl: productResponse.coverPictureUrl,
      price: productResponse.price,
    );
  }

  static List<domain.Product> toDomainList(
    List<data.Product> productResponses,
  ) {
    return productResponses.map((response) => toDomain(response)).toList();
  }
}
