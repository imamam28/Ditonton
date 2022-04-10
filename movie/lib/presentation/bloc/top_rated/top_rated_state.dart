part of 'top_rated_cubit.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  final List<Movie> movies;

  TopRatedSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class TopRatedError extends TopRatedState {
  final String errorMessage;

  TopRatedError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
