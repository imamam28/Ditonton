import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/get_popular_series.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final GetPopularSeries getPopularSeries;
  PopularCubit(this.getPopularSeries) : super(PopularInitial());

  Future<void> fetchPopularSeries() async {
    emit(PopularInitial());
    final result = await getPopularSeries.execute();

    result.fold(
      (failure) {
        emit(PopularError(failure.message));
      },
      (seriesData) {
        emit(PopularSuccess(seriesData));
      },
    );
  }
}
