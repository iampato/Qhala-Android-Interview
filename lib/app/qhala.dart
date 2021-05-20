import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qhala/app/screens/home_page.dart';
import 'package:qhala/app/widgets/color_pallete.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.openSans().fontFamily,
        scaffoldBackgroundColor: AppTheme.theme(context).bg1,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.openSans().fontFamily,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
