import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/category.dart';
import '../mappers/category_mapper.dart';

class CategoriesRemoteDataSource {
  final ApiService _apiService;
  CategoriesRemoteDataSource(this._apiService);

  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      final categories = CategoryMapper.toDomainList(response.categories);
      return ApiResult.success(categories);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
