part of 'top_rated_cubit.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  final List<Series> series;

  TopRatedSuccess(this.series);

  @override
  List<Object> get props => [series];
}

class TopRatedError extends TopRatedState {
  final String errorMessage;

  TopRatedError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
