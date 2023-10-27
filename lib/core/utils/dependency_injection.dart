import 'package:bookly_app/Features/Home/data/reposotory/home_repo_implementaion.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(dio: getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServices: getIt.get<ApiServices>()));
}
