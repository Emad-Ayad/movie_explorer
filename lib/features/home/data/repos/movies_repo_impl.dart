import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_explorer/core/errors/failure.dart';
import 'package:movie_explorer/core/services/api_service.dart';
import 'package:movie_explorer/features/home/data/models/movie_model.dart';
import 'package:movie_explorer/features/home/data/repos/movies_repo.dart';

class MovieRepoImpl extends MoviesRepo {
  final ApiService apiService;

  MovieRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final response = await apiService.getMovies(endPoint: 'popular');
      final movies = (response['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
      return Right(movies);
    } on DioException catch (e) {
      return Left(
        Failure(
          errMessage: 'Failed to load movies: ${e.message}',
        ),
      );
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails({required int movieId}) async {
    try {
      final response = await apiService.getMovies(movieId: movieId);
      final movie = Movie.fromJson(response);
      return Right(movie);
    } on DioException catch (e) {
      return Left(
          Failure(errMessage: 'Failed to load movie details: ${e.message}'));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error: $e'));
    }
  }
}
