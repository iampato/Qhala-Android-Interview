part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final int theme;
  ThemeLoaded({@required this.theme});

  @override
  List<Object> get props => [theme];

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ThemeLoaded && o.theme == theme;
  }

  @override
  int get hashCode => theme.hashCode;
}
