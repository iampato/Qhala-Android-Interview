part of '_repositories.dart';

@UseDao(tables: [PopularMovies])
class PopularMoviesDao extends DatabaseAccessor<MyDatabase>
    with _$PopularMoviesDaoMixin {
  // Declare the constructor needed by the generated mixin
  PopularMoviesDao(MyDatabase db) : super(db);

  /// getDbPopularMovies
  /// Future method that returns a list of popular movies
  /// params none are required
  Future<List<Result>> getDbPopularMovies() async {
    final results = await select(popularMovies).get();
    if (results.isNotEmpty) {
      return results.map((res) {
        return Result(
          adult: res.adult,
          backdropPath: res.backdropPath,
          id: res.id,
          originalLanguage: res.originalLanguage,
          originalTitle: res.originalTitle,
          overview: res.overview,
          popularity: res.popularity,
          posterPath: res.posterPath,
          releaseDate: res.releaseDate,
          title: res.title,
          video: res.video,
          voteAverage: res.voteAverage,
          voteCount: res.voteCount,
        );
      }).toList();
    } else {
      return Future.value([]);
    }
  }

  /// streamDbPopularMovies
  /// Stream method that return a list of popular movies
  /// params are not required
  Stream<List<Result>> streamDbPopularMovies() {
    final results = select(popularMovies).watch();
    return results.map((list) {
      return list.map((res) {
        return Result(
          adult: res.adult,
          backdropPath: res.backdropPath,
          id: res.id,
          originalLanguage: res.originalLanguage,
          originalTitle: res.originalTitle,
          overview: res.overview,
          popularity: res.popularity,
          posterPath: res.posterPath,
          releaseDate: res.releaseDate,
          title: res.title,
          video: res.video,
          voteAverage: res.voteAverage,
          voteCount: res.voteCount,
        );
      });
    });
  }

  /// insertPopularMovies
  /// Future methods that return an int depending on the success of its operations
  /// 1 to imply success 0 to imply error
  /// One param is `required!` a `Result` object that is converted to a
  /// PopularMoviesCompanion for inserts
  Future<int> insertPopularMovies(Result result) async {
    return into(popularMovies).insert(PopularMoviesCompanion(
      adult: Value(result.adult),
      backdropPath: Value(result.backdropPath),
      id: Value(result.id),
      originalLanguage: Value(result.originalLanguage),
      originalTitle: Value(result.originalTitle),
      overview: Value(result.overview),
      popularity: Value(result.popularity),
      posterPath: Value(result.posterPath),
      voteCount: Value(result.voteCount),
      voteAverage: Value(result.voteAverage),
      video: Value(result.video),
      title: Value(result.title),
      releaseDate: Value(result.releaseDate),
    ));
  }
}
