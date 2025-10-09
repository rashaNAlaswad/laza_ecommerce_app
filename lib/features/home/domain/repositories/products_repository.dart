import '../../../../core/networking/api_result.dart';
import '../entities/product.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<Product>>> getAllProducts();
}
