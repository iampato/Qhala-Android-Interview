import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qhala/app/cubits/Theme/theme_cubit.dart';
import 'package:qhala/app/screens/home_page.dart';
import 'package:qhala/app/widgets/color_pallete.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int theme = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listener: (context, state) {
        if (state is ThemeLoaded) {
          setState(() {
            theme = state.theme;
          });
        }
      },
      child: MaterialApp(
        title: 'Movie App',
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget),
            defaultScale: true,
            minWidth: 480,
            defaultName: MOBILE,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.resize(750, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(
              color: AppTheme.theme(context).bg1,
            ),
          );
        },
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: getTheme(theme),
          fontFamily: GoogleFonts.openSans().fontFamily,
          scaffoldBackgroundColor: getTheme(theme) == Brightness.dark
              ? null
              : AppTheme.theme(context).bg1,
        ),
        darkTheme: theme == 2
            ? ThemeData(
                primarySwatch: Colors.red,
                brightness: Brightness.dark,
                fontFamily: GoogleFonts.openSans().fontFamily,
                // scaffoldBackgroundColor: Colors.black,
              )
            : null,
        home: HomePage(),
      ),
    );
  }

  Brightness getTheme(int value) {
    if (value == 0) {
      return Brightness.light;
    } else if (value == 1) {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }
}
