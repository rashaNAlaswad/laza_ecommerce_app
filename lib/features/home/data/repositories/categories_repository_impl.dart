import '../../../../core/networking/api_result.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import '../data_sources/categories_remote_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _dataSource;
  CategoriesRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    return await _dataSource.getCategories();
  }
}
