import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhala/app/screens/widgets/movie_item.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MovieItem();
        },
      ),
    );
  }
}