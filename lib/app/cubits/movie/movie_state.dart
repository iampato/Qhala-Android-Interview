part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieLoaded extends MovieState {
  final MovieModel movieModel;

  MovieLoaded({@required this.movieModel});

  @override
  List<Object> get props => [movieModel];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieLoaded && other.movieModel == movieModel;
  }

  @override
  int get hashCode => movieModel.hashCode;

  @override
  String toString() =>
      'MovieLoaded(page: ${movieModel.page},results :${movieModel.results.length})';
}
