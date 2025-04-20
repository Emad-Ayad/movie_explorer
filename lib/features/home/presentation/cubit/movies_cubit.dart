import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_explorer/features/home/data/models/movie_model.dart';
import 'package:movie_explorer/features/home/data/repos/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());
  final MoviesRepo moviesRepo;
  List<Movie> _cachedMovies = [];

  Future<void> getPopularMovies() async {
    if (_cachedMovies.isNotEmpty) {
      emit(MoviesSuccess(_cachedMovies));
      return;
    }

    emit(MoviesLoading());
    final result = await moviesRepo.getPopularMovies();
    result.fold(
          (failure) => emit(MoviesFailure(failure.errMessage)),
          (movies) {
        _cachedMovies = movies;
        emit(MoviesSuccess(movies));
      },
    );
  }

  Future<void> getMovieDetails(int movieId) async {
    emit(DetailsLoading());
    final result = await moviesRepo.getMovieDetails(movieId: movieId);
    result.fold(
      (failure) => emit(DetailsFailure(failure.errMessage)),
      (movie) => emit(DetailsSuccess(movie)),
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
