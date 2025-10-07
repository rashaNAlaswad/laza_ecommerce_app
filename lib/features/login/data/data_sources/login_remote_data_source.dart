import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_result.dart';
import '../models/login_request_body.dart';

class LoginRemoteDataSource {
  final ApiService _apiService;
  LoginRemoteDataSource(this._apiService);

  Future<ApiResult<LoginResult>> login(LoginRequest loginRequest) async {
    try {
      final loginRequestBody = LoginRequestBody(
        email: loginRequest.email,
        password: loginRequest.password,
      );
      final response = await _apiService.login(loginRequestBody);

      final loginResult = LoginResult(
        accessToken: response.accessToken,
        expiresAtUtc: response.expiresAtUtc,
        refreshToken: response.refreshToken,
      );

      return ApiResult.success(loginResult);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
