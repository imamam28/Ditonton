part of 'now_playing_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  final List<Movie> movies;

  NowPlayingSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingError extends NowPlayingState {
  final String errorMessage;

  NowPlayingError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
