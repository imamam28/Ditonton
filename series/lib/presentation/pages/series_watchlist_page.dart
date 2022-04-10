import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/bloc.dart';
import 'package:series/presentation/widgets/series_card_list.dart';

class SeriesWatchlistPage extends StatefulWidget {
  @override
  State<SeriesWatchlistPage> createState() => _SeriesWatchlistPageState();
}

class _SeriesWatchlistPageState extends State<SeriesWatchlistPage> {
  @override
  void initState() {
    Future.microtask(
      () => BlocProvider.of<WatchListCubit>(context).fetchWatchList(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WatchList Movie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
            if (state is WatchListInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WatchListSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = state.series[index];
                  return SeriesCard(series);
                },
                itemCount: state.series.length,
              );
            } else if (state is WatchListError) {
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
