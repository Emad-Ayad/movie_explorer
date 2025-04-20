class MovieModel {
  final List<Movie> movies;
  final int page;
  final int totalPages;

  MovieModel({
    required this.movies,
    required this.page,
    required this.totalPages,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      movies: (json['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList(),
      page: json['page'],
      totalPages: json['total_pages'],
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String releaseYear;
  final String backdropPath;
  final double voteAverage;
  final String overview;


  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseYear,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
      releaseYear: json['release_date'] ,
      backdropPath: json['backdrop_path'] ,
      voteAverage: json['vote_average'] ,
      overview: json['overview'] ,
    );
  }
}