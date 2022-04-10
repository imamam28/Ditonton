import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series/presentation/bloc/bloc.dart';
import 'package:series/presentation/widgets/series_card_list.dart';

class SeriesSearchPage extends StatefulWidget {
  @override
  State<SeriesSearchPage> createState() => _SeriesSearchPageState();
}

class _SeriesSearchPageState extends State<SeriesSearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Series')),
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
                        final series = state.series[index];
                        return SeriesCard(series);
                      },
                      itemCount: state.series.length,
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
