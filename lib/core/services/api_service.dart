import 'package:dio/dio.dart';

import '../constants/constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> getMovies({
    String? endPoint,
    int? movieId,
  }) async {
    try {
      final String url;
      if (movieId != null) {
        url = '$baseUrl/movie/$movieId';
      } else if (endPoint == 'popular') {
        url = '$baseUrl/movie/popular';
      } else {
        throw ArgumentError('Unsupported endpoint: $endPoint');
      }

      final response = await dio.get(
        url,
        queryParameters: {'api_key': apiKey},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> searchMovies(String query) async {
    try {
      final response = await dio.get(
        '$baseUrl/search/movie',
        queryParameters: {
          'api_key': apiKey,
          'query': query,
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
