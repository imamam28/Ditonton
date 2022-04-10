part of 'on_air_cubit.dart';

abstract class OnAirState extends Equatable {
  const OnAirState();

  @override
  List<Object> get props => [];
}

class OnAirInitial extends OnAirState {}

class OnAirSuccess extends OnAirState {
  final List<Series> series;

  OnAirSuccess(this.series);

  @override
  List<Object> get props => [series];
}

class OnAirError extends OnAirState {
  final String errorMessage;

  OnAirError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
