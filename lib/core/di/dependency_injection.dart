import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/signup/data/data_sources/signup_remote_data_source.dart';
import '../../features/signup/data/repositories/signup_repository_impl.dart';
import '../../features/signup/domain/repositories/signup_repository.dart';
import '../../features/signup/presentation/cubit/signup_cubit.dart';
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
}
