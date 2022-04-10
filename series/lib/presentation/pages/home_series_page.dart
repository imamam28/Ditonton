import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/on_air/on_air_cubit.dart';
import 'package:series/presentation/bloc/popular/popular_cubit.dart';
import 'package:series/presentation/bloc/top_rated/top_rated_cubit.dart';

import 'series_list.dart';

class HomeSeriesPage extends StatefulWidget {
  @override
  _HomeSeriesPageState createState() => _HomeSeriesPageState();
}

class _HomeSeriesPageState extends State<HomeSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<OnAirCubit>(context).fetchOnAirSeries();
      BlocProvider.of<PopularCubit>(context).fetchPopularSeries();
      BlocProvider.of<TopRatedCubit>(context).fetchTopRatedSeries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubHeading(
            title: 'On Air',
            onTap: () => Navigator.pushNamed(context, seriesOnAirRoute),
          ),
          BlocBuilder<OnAirCubit, OnAirState>(
            builder: (context, state) {
              if (state is OnAirInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is OnAirSuccess) {
                return SeriesList(state.series);
              } else if (state is OnAirError) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          _buildSubHeading(
            title: 'Popular',
            onTap: () => Navigator.pushNamed(context, seriesPopularRoute),
          ),
          BlocBuilder<PopularCubit, PopularState>(
            builder: (context, state) {
              if (state is PopularInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PopularSuccess) {
                return SeriesList(state.series);
              } else if (state is PopularError) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          _buildSubHeading(
            title: 'Top Rated',
            onTap: () => Navigator.pushNamed(context, seriesTopRatedRoute),
          ),
          BlocBuilder<TopRatedCubit, TopRatedState>(
            builder: (context, state) {
              if (state is TopRatedInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TopRatedSuccess) {
                return SeriesList(state.series);
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
