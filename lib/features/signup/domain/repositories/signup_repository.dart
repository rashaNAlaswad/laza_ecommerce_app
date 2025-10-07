import '../../../../core/networking/api_result.dart';
import '../entities/signup_request.dart';

abstract class SignupRepository {
  Future<ApiResult<void>> signup(SignupRequest signupRequest);
}
