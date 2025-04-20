import 'package:dartz/dartz.dart';
import 'package:movie_explorer/core/errors/failure.dart';
import 'package:movie_explorer/features/home/data/models/movie_model.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, Movie>> getMovieDetails({required int movieId});

  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
