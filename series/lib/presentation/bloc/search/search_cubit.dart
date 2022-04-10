import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/search_series.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchSeries searchSeries;
  SearchCubit(this.searchSeries) : super(SearchInitial());

  Future<void> fetchSearch(String query) async {
    emit(SearchInitial());
    final result = await searchSeries.execute(query);

    result.fold(
      (failure) {
        emit(SearchError(failure.message));
      },
      (seriesData) {
        emit(SearchSuccess(seriesData));
      },
    );
  }
}
