import 'package:moor/moor.dart';

class PopularMovies extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get adult => boolean()();
  TextColumn get backdropPath => text().withLength(min: 0, max: 250)();
  TextColumn get originalLanguage => text().withLength(min: 0, max: 100)();
  TextColumn get originalTitle => text().withLength(min: 0, max: 200)();
  TextColumn get overview => text().withLength(min: 0, max: 100)();
  RealColumn get popularity => real()();
  TextColumn get posterPath => text().withLength(min: 0, max: 250)();
  TextColumn get title => text().withLength(min: 0, max: 250)();
  DateTimeColumn get releaseDate => dateTime()();
  BoolColumn get video => boolean()();
  RealColumn get voteAverage => real()();
  IntColumn get voteCount => integer()();
}
