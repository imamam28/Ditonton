import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/get_watchlist_series.dart';

part 'watchlist_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final GetWatchlistSeries getWatchlistSeries;
  WatchListCubit(this.getWatchlistSeries) : super(WatchListInitial());

  Future<void> fetchWatchList() async {
    emit(WatchListInitial());
    final result = await getWatchlistSeries.execute();

    result.fold(
      (failure) {
        emit(WatchListError(failure.message));
      },
      (seriesData) {
        emit(WatchListSuccess(seriesData));
      },
    );
  }
}
