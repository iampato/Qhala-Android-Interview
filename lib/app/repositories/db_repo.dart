part of '_repositories.dart';

@UseDao(tables: [PopularMovies])
class PopularMoviesDao extends DatabaseAccessor<MyDatabase>
    with _$PopularMoviesDaoMixin {
  PopularMoviesDao(MyDatabase db) : super(db);

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
}
