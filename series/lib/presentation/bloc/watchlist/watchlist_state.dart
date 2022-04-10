part of 'watchlist_cubit.dart';

abstract class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

class WatchListInitial extends WatchListState {}

class WatchListSuccess extends WatchListState {
  final List<Series> series;

  WatchListSuccess(this.series);

  @override
  List<Object> get props => [series];
}

class WatchListError extends WatchListState {
  final String errorMessage;

  WatchListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
