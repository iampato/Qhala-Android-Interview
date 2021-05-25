// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(Map<String, dynamic> data) =>
    MovieModel.fromJson(data);

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

const String _baseUrl = 'http://image.tmdb.org/t/p';

class MovieModel {
  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MovieModel copyWith({
    int page,
    List<Result> results,
    int totalPages,
    int totalResults,
  }) =>
      MovieModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result copyWith({
    bool adult,
    String backdropPath,
    List<int> genreIds,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    double popularity,
    String posterPath,
    DateTime releaseDate,
    String title,
    bool video,
    double voteAverage,
    int voteCount,
  }) =>
      Result(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  // backdrop image url
  String get smallBackdropImageUrl {
    if (backdropPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/w92$backdropPath";
  }

  String get mediumBackdropImageUrl {
    if (backdropPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/w185$backdropPath";
  }

  String get largeBackdropImageUrl {
    if (backdropPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/w500$backdropPath";
  }

  String get originalBackdropImageUrl {
    if (backdropPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/original$backdropPath";
  }

  // poster image url
  String get smallPosterImageUrl {
    if (posterPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/w92$posterPath";
  }

  String get mediumPosterImageUrl {
    if (posterPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/w185$posterPath";
  }

  String get largePosterImageUrl {
    if (posterPath == null) {
      throw Exception('Poster image path not defined.');
    }
    return "$_baseUrl/w500$posterPath";
  }
}
