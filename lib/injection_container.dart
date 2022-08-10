import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/app_interceptors.dart';
import 'features/ipinfo/domain/repositories/ipinfo_repository.dart';
import 'features/ipinfo/presentation/cubit/ipinfo_cubit.dart';
import 'features/myip/data/datasources/lang_local_data_source.dart';
import 'features/myip/data/datasources/myip_remote_data_source.dart';
import 'features/myip/data/repositories/lang_repository_impl.dart';
import 'features/myip/domain/repositories/lang_repository.dart';
import 'features/myip/domain/repositories/myip_repository.dart';
import 'features/myip/domain/usecases/change_lang.dart';
import 'features/myip/domain/usecases/get_myip_usecase.dart';
import 'features/myip/domain/usecases/get_saved_lang.dart';
import 'features/myip/presentation/cubit/locale_cubit.dart';
import 'config/themes/cubit/app_theme_cubit.dart';
import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/ipinfo/data/datasources/ipinfo_local_data_source.dart';
import 'features/ipinfo/data/datasources/ipinfo_remote_data_source.dart';
import 'features/ipinfo/data/repositories/ipinfo_repository_impl.dart';
import 'features/ipinfo/domain/usecases/get_ipinfo_usecase.dart';
import 'features/myip/data/datasources/myip_local_data_source.dart';
import 'features/myip/data/repositories/myip_repository_impl.dart';
import 'features/myip/presentation/cubit/myip_cubit.dart';

// sl : server locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //* BLoCs
  sl.registerFactory<MyipCubit>(() => MyipCubit(getMyipUseCase: sl()));
  sl.registerFactory<IpinfoCubit>(() => IpinfoCubit(getIpinfoUseCase: sl()));
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));
  sl.registerFactory<AppThemeCubit>(
      () => AppThemeCubit(sharedPreferences: sl()));

  //* Use Cases
  sl.registerLazySingleton<GetMyipUseCase>(
      () => GetMyipUseCase(myipRepository: sl()));
  sl.registerLazySingleton<GetIpinfoUseCase>(
      () => GetIpinfoUseCase(ipinfoRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));

  //* Repository
  sl.registerLazySingleton<MyipRepository>(() => MyipRepositoryImpl(
      networkInfo: sl(),
      myipLocalDataSource: sl(),
      myipRemoteDataSource: sl()));
  sl.registerLazySingleton<IpinfoRepository>(() => IpinfoRepositoryImpl(
      networkInfo: sl(),
      ipinfoLocalDataSource: sl(),
      ipinfoRemoteDataSource: sl()));
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));

  //* Data sources
  sl.registerLazySingleton<MyipLocalDataSource>(
      () => MyipLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<MyipRemoteDataSource>(
      () => MyipRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<IpinfoLocalDataSource>(
      () => IpinfoLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<IpinfoRemoteDataSource>(
      () => IpinfoRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
