part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<Movie> movies;
  MoviesSuccess(this.movies);
}

class MoviesFailure extends MoviesState {
  final String message;
  MoviesFailure(this.message);
}

class DetailsLoading extends MoviesState {}

class DetailsSuccess extends MoviesState {
  final Movie movie;
  DetailsSuccess(this.movie);
}

class DetailsFailure extends MoviesState {
  final String message;
  DetailsFailure(this.message);
}



