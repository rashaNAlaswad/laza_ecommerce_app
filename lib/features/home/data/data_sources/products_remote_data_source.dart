import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/product.dart' as domain;
import '../mappers/product_mapper.dart';

class ProductsRemoteDataSource {
  final ApiService _apiService;
  ProductsRemoteDataSource(this._apiService);

  Future<ApiResult<List<domain.Product>>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProducts();
      final products = ProductMapper.toDomainList(response.items);
      return ApiResult.success(products);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
