import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/on_air/on_air_cubit.dart';
import 'package:series/presentation/widgets/series_card_list.dart';

class OnAirSeriesPage extends StatefulWidget {
  @override
  _OnAirSeriesPageState createState() => _OnAirSeriesPageState();
}

class _OnAirSeriesPageState extends State<OnAirSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On Air Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnAirCubit, OnAirState>(
          builder: (context, state) {
            if (state is OnAirInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is OnAirSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = state.series[index];
                  return SeriesCard(series);
                },
                itemCount: state.series.length,
              );
            } else if (state is OnAirError) {
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
