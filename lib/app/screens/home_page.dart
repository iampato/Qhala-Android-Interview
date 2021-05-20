import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qhala/app/cubits/movie/movie_cubit.dart';
import 'package:qhala/app/models/movie_model.dart';
import 'package:qhala/app/repositories/_repositories.dart';
import 'package:qhala/app/screens/widgets/movie_item.dart';
import 'package:qhala/app/utils/http_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => MovieCubit(
        movieRepository: MovieRepository(
          networkUtil: HttpNetworkUtil(),
        ),
      )..fetchPopularMovies(),
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Popular Movies"),
        ),
        body: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {},
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
                  // Text(state.message),
                ],
              );
            }
            if (state is MovieLoaded) {
              final movieModel = state.movieModel;
              final movieList = movieModel.results;
              return ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  Result result = movieList[index];
                  return MovieItem(
                    result: result,
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
