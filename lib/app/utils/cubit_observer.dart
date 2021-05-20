import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  Logger _logger = Logger();
  @override
  void onCreate(BlocBase cubit) {
    super.onCreate(cubit);
    _logger.i('onCreate -- cubit: ${cubit.runtimeType}');
  }

  @override
  void onChange(BlocBase cubit, Change change) {
    super.onChange(cubit, change);
    _logger.d('onChange -- cubit: ${cubit.runtimeType}, change: $change');
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    _logger.e('onError -- cubit: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onClose(BlocBase cubit) {
    super.onClose(cubit);
    _logger.v('onClose -- cubit: ${cubit.runtimeType}');
  }
}
