import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qhala/app/utils/cubit_observer.dart';

import 'app/qhala.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
