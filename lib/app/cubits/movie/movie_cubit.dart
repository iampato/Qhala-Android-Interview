import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qhala/app/models/movie_model.dart';
import 'package:qhala/app/repositories/_repositories.dart';
import 'package:qhala/app/utils/exceptions.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository movieRepository;
  MovieCubit({@required this.movieRepository}) : super(MovieInitial());

  Future<void> fetchPopularMovies() async {
    try {
      MovieModel movieModel = await movieRepository.httpGetPopularMovies(
        page: 1,
      );
      if (movieModel != null) {
        emit(MovieLoaded(movieModel: movieModel));
      } else {
        emit(MovieError("An error occurred"));
      }
    } catch (e) {
      if (e is InternetException || e is DioHttpException) {
        emit(MovieError(
          "Check your internet connection or " +
              "your internet connection could be slow",
        ));
      } else {
        emit(MovieError(e.toString()));
      }
    }
  }
}
