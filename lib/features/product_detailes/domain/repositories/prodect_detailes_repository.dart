import '../../../../core/networking/api_result.dart';
import '../entities/product_detailes.dart';

abstract class ProdectDetailesRepository {
  Future<ApiResult<ProductDetailes>> getProductById(String id);
}
