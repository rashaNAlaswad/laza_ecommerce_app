import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/models/categories_response.dart';
import '../../features/home/data/models/prodect_response.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/signup/data/models/signup_request_body.dart';
import '../../features/verify_email/data/models/resend_otp_request_body.dart';
import '../../features/verify_email/data/models/verify_email_request_body.dart';
import 'api_urls.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiUrls.register)
  Future<void> signup(@Body() SignupRequestBody signupRequestBody);

  @POST(ApiUrls.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiUrls.verifyEmail)
  Future<void> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
  );

  @POST(ApiUrls.resendOtp)
  Future<void> resendOtp(@Body() ResendOtpRequestBody resendOtpRequestBody);

  @GET(ApiUrls.categories)
  Future<CategoriesResponse> getCategories();

  @GET(ApiUrls.products)
  Future<ProductsResponse> getAllProducts();
}
