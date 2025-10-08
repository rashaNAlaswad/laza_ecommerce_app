import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/signup/data/data_sources/signup_remote_data_source.dart';
import '../../features/signup/data/repositories/signup_repository_impl.dart';
import '../../features/signup/domain/repositories/signup_repository.dart';
import '../../features/signup/presentation/cubit/signup_cubit.dart';
import '../../features/verify_email/data/data_sources/verify_email_remote_data_source.dart';
import '../../features/verify_email/data/repositories/verify_email_repository_impl.dart';
import '../../features/verify_email/domain/repositories/verify_email_repository.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

setupGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Signup feature
  getIt.registerLazySingleton<SignupRemoteDataSource>(
    () => SignupRemoteDataSource(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(getIt<SignupRemoteDataSource>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(getIt<SignupRepository>()),
  );

  // Login feature
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepository>()));

  // Verify Email feature
  getIt.registerLazySingleton<VerifyEmailRemoteDataSource>(
    () => VerifyEmailRemoteDataSource(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<VerifyEmailRepository>(
    () => VerifyEmailRepositoryImpl(getIt<VerifyEmailRemoteDataSource>()),
  );
}
