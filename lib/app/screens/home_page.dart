import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qhala/app/cubits/Theme/theme_cubit.dart';
import 'package:qhala/app/cubits/movie/movie_cubit.dart';
import 'package:qhala/app/models/http/movie_model.dart';
import 'package:qhala/app/repositories/_repositories.dart';
import 'package:qhala/app/screens/widgets/movie_item.dart';
import 'package:qhala/app/utils/http_client.dart';
import 'package:qhala/app/widgets/color_pallete.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller;
  MovieCubit movieCubit;
  final _scrollThreshold = 200.0;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
    movieCubit = MovieCubit(
      movieRepository: MovieRepository(
        networkUtil: HttpNetworkUtil(),
      ),
    )..fetchPopularMovies();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      movieCubit.fetchPopularMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isPhone = ResponsiveWrapper.of(context).isMobile;
    bool isTablet = ResponsiveWrapper.of(context).isTablet;
    bool isDesktop = ResponsiveWrapper.of(context).isDesktop;
    return BlocProvider(
      create: (context) => movieCubit,
      child: Scaffold(
        appBar: isPhone
            ? AppBar(
                leading: Icon(Icons.menu),
                title: Text("Popular Movies"),
                actions: <Widget>[
                  PopupMenuButton(
                    icon: Icon(
                      BlocProvider.of<ThemeCubit>(context).theme == 0
                          ? Icons.brightness_3
                          : BlocProvider.of<ThemeCubit>(context).theme == 1
                              ? Icons.wb_sunny
                              : Icons.phone_android,
                    ),
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<int>>[
                        PopupMenuItem(
                          value: 1,
                          child: Text("Light Mode"),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text("Dark Mode"),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Text("System"),
                        )
                      ];
                    },
                    onSelected: (myValue) {
                      switch (myValue) {
                        case 1:
                          BlocProvider.of<ThemeCubit>(context)
                              .switchToLightMode();
                          break;
                        case 2:
                          BlocProvider.of<ThemeCubit>(context)
                              .switchToDarkMode();
                          break;
                        case 3:
                          BlocProvider.of<ThemeCubit>(context)
                              .switchToSystemMode();
                          break;
                        default:
                          debugPrint("error");
                      }
                    },
                  )
                ],
              )
            : PreferredSize(
                child: SizedBox.shrink(),
                preferredSize: Size.zero,
              ),
        body: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {
            if (state is MovieLoaded) {
              if (state.message != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }
            }
          },
          builder: (context, state) {
            if (state is MovieInitial) {
              return Center(
                child: LottieBuilder.asset(
                  "assets/lottie/loading.json",
                  animate: true,
                  height: size.height * 0.5,
                  width: size.width,
                ),
              );
            }
            if (state is MovieError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: LottieBuilder.asset(
                      "assets/lottie/error.json",
                      animate: true,
                      repeat: false,
                      height: size.height * 0.5,
                      width: size.width,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(state.message),
                ],
              );
            }
            if (state is MovieLoaded) {
              final movieModel = state.movieModel;
              final movieList = movieModel.results;
              return Builder(
                builder: (context) {
                  if (isDesktop || isTablet) {
                    return Stack(
                      children: [
                        Container(
                          height: size.height * 0.4,
                          width: size.width,
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: kToolbarHeight,
                              left: size.width * (isTablet ? 0.08 : 0.16),
                              right: size.width * (isTablet ? 0.08 : 0.16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    FlutterLogo(),
                                    Text(
                                      "Movie App",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Spacer(),
                                    CupertinoSegmentedControl(
                                      groupValue:
                                          BlocProvider.of<ThemeCubit>(context)
                                              .theme,
                                      padding: EdgeInsets.all(10.0),
                                      borderColor: AppTheme.theme(context).txt,
                                      selectedColor:
                                          AppTheme.theme(context).txt,
                                      unselectedColor: Colors.transparent,
                                      children: <int, Widget>{
                                        0: Text(
                                          "Light",
                                          style: TextStyle(
                                            color: BlocProvider.of<ThemeCubit>(
                                                            context)
                                                        .theme ==
                                                    0
                                                ? AppTheme.theme(context)
                                                    .surface
                                                : null,
                                            fontSize: 15,
                                          ),
                                        ),
                                        1: Text(
                                          "Dark",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: BlocProvider.of<ThemeCubit>(
                                                            context)
                                                        .theme ==
                                                    1
                                                ? AppTheme.theme(context)
                                                    .surface
                                                : null,
                                          ),
                                        ),
                                        2: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Text(
                                            "System",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  BlocProvider.of<ThemeCubit>(
                                                                  context)
                                                              .theme ==
                                                          2
                                                      ? AppTheme.theme(context)
                                                          .surface
                                                      : null,
                                            ),
                                          ),
                                        ),
                                      },
                                      onValueChanged: (i) {
                                        print(i);
                                        switch (i) {
                                          case 0:
                                            BlocProvider.of<ThemeCubit>(context)
                                                .switchToLightMode();
                                            break;
                                          case 1:
                                            BlocProvider.of<ThemeCubit>(context)
                                                .switchToDarkMode();
                                            break;
                                          case 2:
                                            BlocProvider.of<ThemeCubit>(context)
                                                .switchToSystemMode();
                                            break;
                                          default:
                                            debugPrint("error");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Text("Popular movies"),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.2,
                            left: size.width * (isTablet ? 0.075 : 0.15),
                            right: size.width * (isTablet ? 0.075 : 0.15),
                          ),
                          child: GridView.builder(
                            itemCount: state.doneFetchingMore
                                ? movieList.length
                                : movieList.length + 1,
                            controller: controller,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: isTablet ? 0.75 : 1,
                            ),
                            itemBuilder: (context, index) {
                              if (index >= movieList.length) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: SizedBox(
                                      width: 33,
                                      height: 33,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                Result result = movieList[index];
                                return MovieItem(
                                  result: result,
                                  index: index,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return ListView.builder(
                    itemCount: state.doneFetchingMore
                        ? movieList.length
                        : movieList.length + 1,
                    controller: controller,
                    itemBuilder: (context, index) {
                      if (index >= movieList.length) {
                        return Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: SizedBox(
                              width: 33,
                              height: 33,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                              ),
                            ),
                          ),
                        );
                      } else {
                        Result result = movieList[index];
                        return MovieItem(
                          result: result,
                          index: index,
                        );
                      }
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
