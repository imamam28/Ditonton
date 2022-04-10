part of 'watchlist_cubit.dart';

class WatchlistState extends Equatable {
  final bool isAddedWatchlist;
  final bool isSuccess;
  final String? message;

  WatchlistState(
      {this.isAddedWatchlist = false, this.isSuccess = true, this.message});

  factory WatchlistState.initial() => WatchlistState();

  WatchlistState copyWith({
    bool? isAddedWatchlist,
    bool? isSuccess,
    String? message,
  }) {
    return WatchlistState(
      isAddedWatchlist: isAddedWatchlist ?? this.isAddedWatchlist,
      isSuccess: isSuccess ?? this.isSuccess,
      message: message,
    );
  }

  @override
  List<Object?> get props => [isAddedWatchlist, isSuccess, message];
}
