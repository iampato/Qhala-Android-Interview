import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qhala/app/models/movie_model.dart';
import 'package:qhala/app/screens/detail_page.dart';
import 'package:qhala/app/widgets/color_pallete.dart';
import 'package:qhala/app/widgets/page_route_transitions.dart';

class MovieItem extends StatelessWidget {
  final Result result;
  final int index;
  const MovieItem({
    Key key,
    @required this.result,  @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 6,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRoutes.slide(() {
              return DetailMoviePage(
                result: result,
              );
            }),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: _theme.cardColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: result.id,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.width * 0.29,
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: result.smallPosterImageUrl,
                      placeholder: (context, url) => Container(
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
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        "${index+1}. "+result.title,
                        overflow: TextOverflow.ellipsis,
                        style: _theme.textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 2.5,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 16,
                              color: AppTheme.theme(context).grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              DateFormat.yMMMEd().format(
                                result.releaseDate,
                              ),
                              style: TextStyle(
                                color: AppTheme.theme(context).grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
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
                      SizedBox(height: 22),
                      Row(
                        children: [
                          Icon(
                            Icons.flag_outlined,
                            size: 18,
                            color: AppTheme.theme(context).grey,
                          ),
                          SizedBox(width: 10),
                          Text(
                            result.originalLanguage.toUpperCase(),
                            style: TextStyle(
                              color: AppTheme.theme(context).grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
