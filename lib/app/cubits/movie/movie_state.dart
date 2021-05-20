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
  final bool doneFetchingMore;
  final String message;

  MovieLoaded( {
    @required this.movieModel,
    this.doneFetchingMore = false,
    this.message,
  });

  @override
  List<Object> get props => [movieModel,doneFetchingMore,message,];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieLoaded &&
      other.movieModel == movieModel &&
      other.doneFetchingMore == doneFetchingMore &&
      other.message == message;
  }

  @override
  int get hashCode => movieModel.hashCode ^ doneFetchingMore.hashCode ^ message.hashCode;

  @override
  String toString() => 'MovieLoaded(movieModel: $movieModel, doneFetchingMore: $doneFetchingMore, message: $message)';
}
