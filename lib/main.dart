import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qhala/app/cubits/Theme/theme_cubit.dart';
import 'package:qhala/app/repositories/_repositories.dart';
import 'package:qhala/app/utils/cubit_observer.dart';

import 'app/qhala.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
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
