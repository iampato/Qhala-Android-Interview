import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qhala/app/models/movie_model.dart';
import 'package:qhala/app/widgets/color_pallete.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DetailMoviePage extends StatelessWidget {
  final Result result;

  const DetailMoviePage({Key key, @required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    bool isPhone = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isTablet = ResponsiveWrapper.of(context).isTablet;
    bool isDesktop = ResponsiveWrapper.of(context).isDesktop;
    return Scaffold(
      appBar: isPhone
          ? AppBar(
              title: Text(
                result.title,
              ),
            )
          : PreferredSize(
              child: SizedBox.shrink(),
              preferredSize: Size.zero,
            ),
      body: Builder(
        builder: (context) {
          if (isDesktop || isTablet) {
            return Stack(
              children: [
                Container(
                  height: size.height * 0.45,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7),
                        BlendMode.darken,
                      ),
                      image: CachedNetworkImageProvider(
                        isTablet
                            ? result.mediumBackdropImageUrl
                            : result.originalBackdropImageUrl,
                      ),
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(
                    top: kToolbarHeight,
                    left: size.width * (isTablet ? 0.08 : 0.16),
                    right: size.width * (isTablet ? 0.08 : 0.16),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.2,
                    left: size.width * (isTablet ? 0.075 : 0.15),
                    right: size.width * (isTablet ? 0.075 : 0.15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: result.id,
                        child: CachedNetworkImage(
                          fit: BoxFit.fitHeight,
                          height: size.height * 0.338,
                          imageUrl: result.largePosterImageUrl,
                          placeholder: (context, url) => Container(
                            height: size.height * 0.338,
                            decoration: BoxDecoration(
                              color:
                                  AppTheme.theme(context).grey.withOpacity(0.7),
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
                              color:
                                  AppTheme.theme(context).grey.withOpacity(0.7),
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
                          top: 20,
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
                                  DateFormat.yMMMMEEEEd().format(
                                    result.releaseDate,
                                  ),
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
                                  "${result.voteAverage} / 10",
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
                          top: 10,
                        ),
                        child: Text(
                          result.title,
                          style: _theme.textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 15,
                        ),
                        child: Text(
                          result.overview,
                          style: TextStyle(
                            color: AppTheme.theme(context).greyStrong,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: result.id,
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  height: size.height * 0.338,
                  width: size.width,
                  imageUrl: result.largeBackdropImageUrl,
                  placeholder: (context, url) => Container(
                    height: size.height * 0.338,
                    decoration: BoxDecoration(
                      color: AppTheme.theme(context).grey.withOpacity(0.7),
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
                      color: AppTheme.theme(context).grey.withOpacity(0.7),
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
                          DateFormat.yMMMMEEEEd().format(
                            result.releaseDate,
                          ),
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
                          "${result.voteAverage} / 10",
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
                  result.title,
                  style: _theme.textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 15,
                ),
                child: Text(
                  result.overview,
                  style: TextStyle(
                    color: AppTheme.theme(context).greyStrong,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
