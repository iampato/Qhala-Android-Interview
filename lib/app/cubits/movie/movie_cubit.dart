import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:qhala/app/models/http/movie_model.dart';
import 'package:qhala/app/repositories/_repositories.dart';
import 'package:qhala/app/utils/exceptions.dart';

part 'movie_state.dart';

class MovieCubit extends HydratedCubit<MovieState> {
  final MovieRepository movieRepository;
  MovieCubit({@required this.movieRepository}) : super(MovieInitial());

  Future<void> fetchPopularMovies() async {
    final currentState = state;
    if (currentState is MovieInitial) {
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
    if (currentState is MovieLoaded) {
      MovieModel movieModel = currentState.movieModel;
      final page = movieModel.page;
      final totalPages = movieModel.totalPages;
      // final resultsLength = movieModel.results.length;
      // final totalResultsLength = movieModel.totalResults;
      try {
        int nextPage = page + 1;
        if (nextPage > totalPages) {
          emit(MovieLoaded(
            movieModel: movieModel,
            doneFetchingMore: true,
            message: "You have viewed all popular movies",
          ));
        } else {
          MovieModel newMovieModel = await movieRepository.httpGetPopularMovies(
            page: nextPage,
          );
          if (movieModel != null) {
            MovieModel mutatedMovieModel = MovieModel(
              page: newMovieModel.page,
              results: List.of(movieModel.results)
                ..addAll(newMovieModel.results),
              totalPages: newMovieModel.totalPages,
              totalResults: newMovieModel.totalResults,
            );
            emit(
              MovieLoaded(
                movieModel: mutatedMovieModel,
                doneFetchingMore:
                    mutatedMovieModel.page >= mutatedMovieModel.totalPages,
              ),
            );
          } else {
            emit(
              MovieLoaded(
                  movieModel: movieModel,
                  message: "An error occured fetching more"),
            );
          }
        }
      } catch (e) {
        if (e is InternetException || e is DioHttpException) {
          emit(
            MovieLoaded(
              movieModel: movieModel,
              message: "Check your internet connection or " +
                  "your internet connection could be slow",
            ),
          );
        } else {
          emit(
            MovieLoaded(
              movieModel: movieModel,
              message: e.toString(),
            ),
          );
        }
      }
    }
  }

  @override
  MovieState fromJson(Map<String, dynamic> json) {
    bool fetchMore = json["fetch_more"];
    String message = json["message"];
    String movieString = json["movie"];
    final movieJson = jsonDecode(movieString);

    return MovieLoaded(
      doneFetchingMore: fetchMore,
      message: message,
      movieModel: MovieModel.fromJson(movieJson),
    );
  }

  @override
  Map<String, dynamic> toJson(MovieState state) {
    final currentState = state;
    if (currentState is MovieLoaded) {
      return {
        "fetch_more": currentState.doneFetchingMore,
        "message": currentState.message,
        "movie": currentState.movieModel.toJson(),
      };
    }
    return null;
  }
}
