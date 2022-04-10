part of 'popular_cubit.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularSuccess extends PopularState {
  final List<Movie> movies;

  PopularSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularError extends PopularState {
  final String errorMessage;

  PopularError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
