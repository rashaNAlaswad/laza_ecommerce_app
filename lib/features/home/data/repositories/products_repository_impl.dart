import '../../../../core/networking/api_result.dart';
import '../../domain/entities/product.dart' as domain;
import '../../domain/repositories/products_repository.dart';
import '../data_sources/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _dataSource;
  ProductsRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<domain.Product>>> getAllProducts() async {
    return await _dataSource.getAllProducts();
  }
}
