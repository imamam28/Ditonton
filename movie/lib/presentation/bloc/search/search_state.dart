part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movie> movies;

  SearchSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
