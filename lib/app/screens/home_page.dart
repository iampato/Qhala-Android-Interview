import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qhala/app/widgets/color_pallete.dart';

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
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://lifesuccessforteens.com/wp-content/uploads/2019/07/Life-success-for-teens-1.jpg",
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          color: AppTheme.theme(context).grey,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.photo,
                            color: AppTheme.theme(context).bg1,
                            size: 60,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        decoration: BoxDecoration(
                          color: AppTheme.theme(context).grey,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.error,
                            color: AppTheme.theme(context).bg1,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
