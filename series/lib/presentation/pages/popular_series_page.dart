import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/popular/popular_cubit.dart';
import 'package:series/presentation/widgets/series_card_list.dart';

class PopularSeriesPage extends StatefulWidget {
  @override
  _PopularSeriesPageState createState() => _PopularSeriesPageState();
}

class _PopularSeriesPageState extends State<PopularSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularCubit, PopularState>(
          builder: (context, state) {
            if (state is PopularInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PopularSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = state.series[index];
                  return SeriesCard(series);
                },
                itemCount: state.series.length,
              );
            } else if (state is PopularError) {
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
