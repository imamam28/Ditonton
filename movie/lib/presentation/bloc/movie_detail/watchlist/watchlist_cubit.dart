import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_watchlist_status_movie.dart';
import 'package:movie/domain/usecases/remove_watchlist_movie.dart';
import 'package:movie/domain/usecases/save_watchlist_movie.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final GetWatchListStatusMovie getWatchListStatus;
  final SaveWatchlistMovie saveWatchlist;
  final RemoveWatchlistMovie removeWatchlist;
  WatchlistCubit(
      this.getWatchListStatus, this.saveWatchlist, this.removeWatchlist)
      : super(WatchlistState.initial());

  Future<void> loadWatchlistStatus(int id) async {
    emit(WatchlistState.initial());
    final result = await getWatchListStatus.execute(id);
    emit(state.copyWith(isAddedWatchlist: result, message: null));
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

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

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);

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
