import 'package:flutter_application_5/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_5/features/auth/data/web_services/auth_web_services.dart';
import 'package:flutter_application_5/features/auth/logic/auth_cubit.dart';
import 'package:flutter_application_5/features/home/data/repository/home_reposity.dart';
import 'package:flutter_application_5/features/home/data/web_services/home_weeb_services.dart';
import 'package:flutter_application_5/features/home/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void initGetIt() {
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt()));
  getIt.registerLazySingleton(() => AuthWebServices());


  getIt.registerFactory(() => HomeCubit(getIt()));
  getIt.registerLazySingleton(() => HomeReposity(getIt()));
  getIt.registerLazySingleton(() => HomeWeebServices());
}
