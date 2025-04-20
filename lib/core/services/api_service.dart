import 'package:dio/dio.dart';

import '../constants/constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  // Future<Map<String, dynamic>> get({
  //   required String endPoint,
  //   int? movieId,
  //   String? query
  // }) async {
  //   var response = await dio.get(
  //     "$_baseUrl$endPoint",
  //     queryParameters: {'api_key': apiKey,},
  //   );
  //   return response.data;
  // }

  // Get popular movies
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


  //
  // // Search movies
  //  Future<List<Movie>> searchMovies(String query) async {
  //   try {
  //     final response = await _dio.get(
  //       'https://api.themoviedb.org/3/search/movie',
  //       queryParameters: {'api_key': _apiKey, 'query': query},
  //     );
  //     return (response.data['results'] as List)
  //         .map((json) => Movie.fromJson(json))
  //         .toList();
  //   } catch (e) {
  //     throw Exception('Failed to search movies: $e');
  //   }
  // }
}
