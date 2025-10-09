import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/product_detailes.dart';
import '../mappers/product_detailes_mapper.dart';

class ProdectDetailesRemoteDataSource {
  final ApiService _apiService;
  ProdectDetailesRemoteDataSource(this._apiService);

  Future<ApiResult<ProductDetailes>> getProductById(String id) async {
    try {
      final response = await _apiService.getProductById(id);
      final productDetailes = ProductDetailesMapper.toDomain(response);
      return ApiResult.success(productDetailes);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
