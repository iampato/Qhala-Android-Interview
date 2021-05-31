import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qhala/app/cubits/Theme/theme_cubit.dart';
import 'package:qhala/app/repositories/_repositories.dart';
import 'package:qhala/app/utils/cubit_observer.dart';
import 'package:qhala/app/utils/hive_utils.dart';

import 'app/qhala.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await HiveUtils.initHiveDb();
  HiveUtils.testHive();
  runApp(
    BlocProvider(
      create: (context) {
        return ThemeCubit(
          preferencesRepository: SharedPreferencesRepository(),
        )..decideOnTheme();
      },
      child: MyApp(),
    ),
  );
}
