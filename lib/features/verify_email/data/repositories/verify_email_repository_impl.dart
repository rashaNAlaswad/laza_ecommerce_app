import '../../../../core/networking/api_result.dart';
import '../../domain/entities/verify_email_request.dart';
import '../../domain/repositories/verify_email_repository.dart';
import '../data_sources/verify_email_remote_data_source.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  final VerifyEmailRemoteDataSource _dataSource;
  VerifyEmailRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<void>> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  ) async {
    return await _dataSource.verifyEmail(verifyEmailRequest);
  }

  @override
  Future<ApiResult<void>> resendOtp(String email) async {
    return await _dataSource.resendOtp(email);
  }
}
