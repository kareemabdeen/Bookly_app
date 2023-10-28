import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Home/data/reposotory/home_repo_implementaion.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(dio: getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServices: getIt.get<ApiServices>()));
}
