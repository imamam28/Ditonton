part of 'popular_cubit.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularSuccess extends PopularState {
  final List<Series> series;

  PopularSuccess(this.series);

  @override
  List<Object> get props => [series];
}

class PopularError extends PopularState {
  final String errorMessage;

  PopularError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
