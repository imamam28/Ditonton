import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';

part 'watchlist_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final GetWatchlistMovies getWatchlistMovies;
  WatchListCubit(this.getWatchlistMovies) : super(WatchListInitial());

  Future<void> fetchWatchList() async {
    emit(WatchListInitial());
    final result = await getWatchlistMovies.execute();

    result.fold(
      (failure) {
        emit(WatchListError(failure.message));
      },
      (moviesData) {
        emit(WatchListSuccess(moviesData));
      },
    );
  }
}
