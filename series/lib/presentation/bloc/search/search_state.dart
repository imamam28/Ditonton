part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Series> series;

  SearchSuccess(this.series);

  @override
  List<Object> get props => [series];
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
