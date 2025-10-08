import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/verify_email_request.dart';
import '../models/resend_otp_request_body.dart';
import '../models/verify_email_request_body.dart';

class VerifyEmailRemoteDataSource {
  final ApiService _apiService;
  VerifyEmailRemoteDataSource(this._apiService);

  Future<ApiResult<void>> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  ) async {
    try {
      final verifyEmailRequestBody = VerifyEmailRequestBody(
        email: verifyEmailRequest.email,
        otp: verifyEmailRequest.otp,
      );
      await _apiService.verifyEmail(verifyEmailRequestBody);

      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> resendOtp(String email) async {
    try {
      final resendOtpRequestBody = ResendOtpRequestBody(email: email);
      await _apiService.resendOtp(resendOtpRequestBody);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
