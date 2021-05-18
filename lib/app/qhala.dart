import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qhala/app/screens/home_page.dart';
import 'package:qhala/app/widgets/color_pallete.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.openSans().fontFamily,
        scaffoldBackgroundColor: AppTheme.theme(context).bg1,
      ),
      home: HomePage(),
    );
  }
}
