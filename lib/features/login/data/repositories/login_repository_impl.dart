import '../../../../core/networking/api_result.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_result.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _dataSource;
  LoginRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<LoginResult>> login(LoginRequest loginRequest) async {
    return await _dataSource.login(loginRequest);
  }
}
