import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qhala/app/repositories/_repositories.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferencesRepository preferencesRepository;
  ThemeCubit({
    @required this.preferencesRepository,
  }) : super(ThemeInitial());

  int theme;

  Future<void> decideOnTheme() async {
    try {
      int currentTheme = await preferencesRepository.getTheme();
      theme = currentTheme;
      print(theme.toString());
      emit(ThemeLoaded(theme: currentTheme));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> switchToLightMode() async {
    try {
      preferencesRepository.setTheme(0);
      theme = 0;
      emit(ThemeLoaded(theme: 0));
    } catch (e) {
      throw Exception(e);
    }
    emit(ThemeLoaded(theme: 0));
  }

  Future<void> switchToDarkMode() async {
    try {
      preferencesRepository.setTheme(1);
      theme = 1;
      emit(ThemeLoaded(theme: 1));
    } catch (e) {
      throw Exception(e);
    }
    emit(ThemeLoaded(theme: 1));
  }

  Future<void> switchToSystemMode() async {
    try {
      preferencesRepository.setTheme(2);
      theme = 2;
      emit(ThemeLoaded(theme: 2));
    } catch (e) {
      throw Exception(e);
    }
    emit(ThemeLoaded(theme: 2));
  }

  Future<void> toggleTheme() async {
    try {
      int currentTheme = await preferencesRepository.getTheme();
      if (currentTheme == 0) {
        await preferencesRepository.setTheme(1);
        theme = 1;
        emit(ThemeLoaded(theme: 1));
      } else {
        await preferencesRepository.setTheme(0);
        theme = 0;
        emit(ThemeLoaded(theme: 0));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
