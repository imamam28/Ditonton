import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/top_rated/top_rated_cubit.dart';
import 'package:series/presentation/widgets/series_card_list.dart';

class TopRatedSeriesPage extends StatefulWidget {
  @override
  _TopRatedSeriesPageState createState() => _TopRatedSeriesPageState();
}

class _TopRatedSeriesPageState extends State<TopRatedSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedCubit, TopRatedState>(
          builder: (context, state) {
            if (state is TopRatedInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TopRatedSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = state.series[index];
                  return SeriesCard(series);
                },
                itemCount: state.series.length,
              );
            } else if (state is TopRatedError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
