import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/bloc.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';

class MovieWatchlistPage extends StatefulWidget {
  @override
  State<MovieWatchlistPage> createState() => _MovieWatchlistPageState();
}

class _MovieWatchlistPageState extends State<MovieWatchlistPage> {
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
                  final movie = state.movies[index];
                  return MovieCard(movie);
                },
                itemCount: state.movies.length,
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
