import 'package:flutter/material.dart';

class AppTheme {
  Color bg1;
  Color surface;
  Color accent1;
  Color accent2;
  Color grey;
  Color greyStrong;
  Color greyWeak;
  Color error;
  Color focus;
  Color txt;
  Color accentTxt;

  static AppTheme theme(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    if (isDarkMode) {
      return isDarkTheme(theme);
    } else {
      return isLightTheme(theme);
    }
  }

  static AppTheme isLightTheme(ThemeData theme) {
    return AppTheme()
      ..bg1 = Color(0xFFf3f6fb)
      ..surface = Colors.white
      ..accent1 = theme.primaryColor
      ..accent2 = theme.accentColor
      ..greyWeak = Color(0xffD8D8D8)
      ..grey = Color(0xff737373)
      ..greyStrong = Color(0xff515d5a)
      ..error = Color(0xffFF1717)
      ..focus = Color(0xFF0ee2b1)
      ..txt = Colors.black
      ..accentTxt = Color(0xFF737373);
  }

  static AppTheme isDarkTheme(ThemeData theme) {
    return AppTheme()
      ..bg1 = Color(0xff00120f)
      ..surface = Color(0xff252525)
      ..accent1 = Color(0xff55a632)
      ..accent2 = Color(0xfff19e46)
      ..greyWeak = Color(0xffa8b3b0)
      ..grey = Color(0xffa8b3b0)
      ..greyStrong = Color(0xffffffff)
      ..error = Color(0xffe55642)
      ..focus = Color(0xff0ee2b1)
      ..txt = Colors.white
      ..accentTxt = Colors.white;
  }
}
