import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_explorer/core/services/api_service.dart';
import 'package:movie_explorer/features/home/data/repos/movies_repo_impl.dart';

import '../../features/home/data/repos/movies_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<MoviesRepo>(
      MovieRepoImpl(apiService: getIt<ApiService>()));
}
