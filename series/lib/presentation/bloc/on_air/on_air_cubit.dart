import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/get_on_air_series.dart';

part 'on_air_state.dart';

class OnAirCubit extends Cubit<OnAirState> {
  final GetOnAirSeries getOnAirSeries;
  OnAirCubit(this.getOnAirSeries) : super(OnAirInitial());

  Future<void> fetchOnAirSeries() async {
    emit(OnAirInitial());
    final result = await getOnAirSeries.execute();

    result.fold(
      (failure) {
        emit(OnAirError(failure.message));
      },
      (seriesData) {
        emit(OnAirSuccess(seriesData));
      },
    );
  }
}
