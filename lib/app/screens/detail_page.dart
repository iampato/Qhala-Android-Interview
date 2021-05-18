import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qhala/app/widgets/color_pallete.dart';

class DetailMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tom Clancy's Without Remorse",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 1,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: size.height * 0.4,
              width: size.width,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: AppTheme.theme(context).grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Tuesday, 12th May 2021",
                      style: TextStyle(
                        color: AppTheme.theme(context).grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: AppTheme.theme(context).grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "5.6 / 10",
                      style: TextStyle(
                        color: AppTheme.theme(context).grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Tom Clancy's Without Remorse",
              style: _theme.textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              "Tom Clancy's Without Remorse",
              style: TextStyle(
                color: AppTheme.theme(context).greyStrong,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
