import '../../../../core/networking/api_result.dart';
import '../entities/category.dart';

abstract class CategoriesRepository {
  Future<ApiResult<List<Category>>> getCategories();
}
