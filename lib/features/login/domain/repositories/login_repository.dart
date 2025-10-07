import '../../../../core/networking/api_result.dart';
import '../entities/login_request.dart';
import '../entities/login_result.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResult>> login(LoginRequest loginRequest);
}

