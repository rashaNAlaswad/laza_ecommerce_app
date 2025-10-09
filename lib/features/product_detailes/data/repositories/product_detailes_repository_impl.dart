import '../../../../core/networking/api_result.dart';
import '../../domain/entities/product_detailes.dart';
import '../../domain/repositories/prodect_detailes_repository.dart';
import '../data_sources/prodect_detailes_remote_data_source.dart';

class ProductDetailesRepositoryImpl implements ProdectDetailesRepository {
  final ProdectDetailesRemoteDataSource _dataSource;
  ProductDetailesRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<ProductDetailes>> getProductById(String productId) async {
    return await _dataSource.getProductById(productId);
  }
}
