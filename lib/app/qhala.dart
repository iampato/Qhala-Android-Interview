import 'package:flutter/material.dart';
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
        scaffoldBackgroundColor: AppTheme.theme(context).bg1
      ),
      home: HomePage(),
    );
  }
}
