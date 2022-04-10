import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/search_movies.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovies searchMovies;
  SearchCubit(this.searchMovies) : super(SearchInitial());

  Future<void> fetchSearch(String query) async {
    emit(SearchInitial());
    final result = await searchMovies.execute(query);

    result.fold(
      (failure) {
        emit(SearchError(failure.message));
      },
      (moviesData) {
        emit(SearchSuccess(moviesData));
      },
    );
  }
}
