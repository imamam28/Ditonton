import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/bloc.dart';
import 'package:series/presentation/widgets/series_card_list.dart';

class SeriesWatchlistPage extends StatefulWidget {
  @override
  State<SeriesWatchlistPage> createState() => _SeriesWatchlistPageState();
}

class _SeriesWatchlistPageState extends State<SeriesWatchlistPage>
    with RouteAware {
  @override
  void initState() {
    Future.microtask(
      () => BlocProvider.of<WatchListCubit>(context).fetchWatchList(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    BlocProvider.of<WatchListCubit>(context).fetchWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WatchList Series')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
            if (state is WatchListInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WatchListSuccess) {
              if (state.series.isEmpty) {
                return Center(child: Text('No WatchList Series added yet'));
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final series = state.series[index];
                    return SeriesCard(series);
                  },
                  itemCount: state.series.length,
                );
              }
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
