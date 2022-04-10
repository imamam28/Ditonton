import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/get_top_rated_series.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final GetTopRatedSeries getTopRatedSeries;
  TopRatedCubit(this.getTopRatedSeries) : super(TopRatedInitial());

  Future<void> fetchTopRatedSeries() async {
    emit(TopRatedInitial());
    final result = await getTopRatedSeries.execute();

    result.fold(
      (failure) {
        emit(TopRatedError(failure.message));
      },
      (seriesData) {
        emit(TopRatedSuccess(seriesData));
      },
    );
  }
}
