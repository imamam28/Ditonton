part of 'watchlist_cubit.dart';

abstract class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

class WatchListInitial extends WatchListState {}

class WatchListSuccess extends WatchListState {
  final List<Movie> movies;

  WatchListSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class WatchListError extends WatchListState {
  final String errorMessage;

  WatchListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
