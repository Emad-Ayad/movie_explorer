part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesSuccess extends MoviesState {
  final List<Movie> movies;

  MoviesSuccess(this.movies);
}

final class DetailsMoviesSuccess extends MoviesState {
  final Movie movie;

  DetailsMoviesSuccess(this.movie);
}

final class MoviesFailure extends MoviesState {
  final String message;

  MoviesFailure(this.message);
}
