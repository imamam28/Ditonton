import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/bloc.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';

class MovieSearchPage extends StatefulWidget {
  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Movie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  BlocProvider.of<SearchCubit>(context).fetchSearch(query);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text('Search Result', style: kHeading6),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (_searchController.text.isEmpty) {
                  return Container();
                } else if (state is SearchInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.movies.length,
                    ),
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
