import '../../../../core/networking/api_result.dart';
import '../../domain/entities/signup_request.dart';
import '../../domain/repositories/signup_repository.dart';
import '../data_sources/signup_remote_data_source.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource _dataSource;
  SignupRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<void>> signup(SignupRequest signupRequest) async {
    return await _dataSource.signup(signupRequest);
  }
}
