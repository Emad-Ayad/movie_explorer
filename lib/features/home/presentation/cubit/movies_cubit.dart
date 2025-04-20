import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_explorer/features/home/data/models/movie_model.dart';
import 'package:movie_explorer/features/home/data/repos/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());
  final MoviesRepo moviesRepo;

  Future<void> getPopularMovies() async {
    emit(MoviesLoading());
    final result = await moviesRepo.getPopularMovies();
    result.fold(
      (failure) => emit(MoviesFailure(failure.errMessage)),
      (movies) => emit(MoviesSuccess(movies)),
    );
  }

  Future<void> getMovieDetails(int movieId) async {
    emit(MoviesLoading());
    final result = await moviesRepo.getMovieDetails(movieId: movieId);
    result.fold(
      (failure) => emit(MoviesFailure(failure.errMessage)),
      (movie) => emit(DetailsMoviesSuccess(movie)),
    );
  }

  Future<void> searchMovies(String query) async {
    emit(MoviesLoading());
      final result = await moviesRepo.searchMovies(query);
    result.fold(
          (failure) => emit(MoviesFailure(failure.errMessage)),
          (movies) => emit(MoviesSuccess(movies)),
    );
  }
}
