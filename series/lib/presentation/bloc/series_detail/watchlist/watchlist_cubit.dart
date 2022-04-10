import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/get_watchlist_status_series.dart';
import 'package:series/domain/usecases/remove_watchlist_series.dart';
import 'package:series/domain/usecases/save_watchlist_series.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final GetWatchListStatusSeries getWatchListStatus;
  final SaveWatchlistSeries saveWatchlist;
  final RemoveWatchlistSeries removeWatchlist;
  WatchlistCubit(
      this.getWatchListStatus, this.saveWatchlist, this.removeWatchlist)
      : super(WatchlistState.initial());

  Future<void> loadWatchlistStatus(int id) async {
    emit(WatchlistState.initial());
    final result = await getWatchListStatus.execute(id);
    emit(state.copyWith(isAddedWatchlist: result, message: null));
  }

  Future<void> addWatchlist(SeriesDetail series) async {
    final result = await saveWatchlist.execute(series);

    result.fold(
      (failure) async {
        emit(state.copyWith(isSuccess: false, message: failure.message));
      },
      (successMessage) async {
        emit(state.copyWith(
            isAddedWatchlist: true, isSuccess: true, message: successMessage));
      },
    );
  }

  Future<void> removeFromWatchlist(SeriesDetail series) async {
    final result = await removeWatchlist.execute(series);

    result.fold(
      (failure) async {
        emit(state.copyWith(isSuccess: false, message: failure.message));
      },
      (successMessage) async {
        emit(state.copyWith(
            isAddedWatchlist: false, isSuccess: true, message: successMessage));
      },
    );
  }
}
