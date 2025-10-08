import '../../../../core/networking/api_result.dart';
import '../entities/verify_email_request.dart';

abstract class VerifyEmailRepository {
  Future<ApiResult<void>> verifyEmail(VerifyEmailRequest verifyEmailRequest);
  Future<ApiResult<void>> resendOtp(String email);
}
