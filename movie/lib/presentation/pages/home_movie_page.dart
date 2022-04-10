import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/now_playing/now_playing_cubit.dart';
import 'package:movie/presentation/bloc/popular/popular_cubit.dart';
import 'package:movie/presentation/bloc/top_rated/top_rated_cubit.dart';

import 'movie_list.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<NowPlayingCubit>(context).fetchNowPlayingMovies();
      BlocProvider.of<PopularCubit>(context).fetchPopularMovies();
      BlocProvider.of<TopRatedCubit>(context).fetchTopRatedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubHeading(
            title: 'Now Playing',
            onTap: () => Navigator.pushNamed(context, movieNowPlayingRoute),
          ),
          BlocBuilder<NowPlayingCubit, NowPlayingState>(
            builder: (context, state) {
              if (state is NowPlayingInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NowPlayingSuccess) {
                return MovieList(state.movies);
              } else if (state is NowPlayingError) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          _buildSubHeading(
            title: 'Popular',
            onTap: () => Navigator.pushNamed(context, moviePopularRoute),
          ),
          BlocBuilder<PopularCubit, PopularState>(
            builder: (context, state) {
              if (state is PopularInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PopularSuccess) {
                return MovieList(state.movies);
              } else if (state is PopularError) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          _buildSubHeading(
            title: 'Top Rated',
            onTap: () => Navigator.pushNamed(context, movieTopRatedRoute),
          ),
          BlocBuilder<TopRatedCubit, TopRatedState>(
            builder: (context, state) {
              if (state is TopRatedInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TopRatedSuccess) {
                return MovieList(state.movies);
              } else if (state is TopRatedError) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
