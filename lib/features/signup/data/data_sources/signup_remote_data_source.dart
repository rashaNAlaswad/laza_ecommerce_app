import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/signup_request.dart';
import '../models/signup_request_body.dart';

class SignupRemoteDataSource {
  final ApiService _apiService;
  SignupRemoteDataSource(this._apiService);

  Future<ApiResult<void>> signup(SignupRequest signupRequest) async {
    try {
      final signupRequestBody = SignupRequestBody(
        firstName: signupRequest.firstName,
        lastName: signupRequest.lastName,
        email: signupRequest.email,
        password: signupRequest.password,
      );
      await _apiService.signup(signupRequestBody);

      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
