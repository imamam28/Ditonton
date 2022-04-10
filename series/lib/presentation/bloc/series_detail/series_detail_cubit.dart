import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:series/domain/usecases/get_series_detail.dart';
import 'package:series/domain/usecases/get_series_recommendations.dart';

export 'watchlist/watchlist_cubit.dart';

part 'series_detail_state.dart';

class SeriesDetailCubit extends Cubit<SeriesDetailState> {
  final GetSeriesDetail getSeriesDetail;
  final GetSeriesRecommendations getSeriesRecommendations;
  SeriesDetailCubit(this.getSeriesDetail, this.getSeriesRecommendations)
      : super(SeriesDetailInitial());

  Future<void> fetchSeriesDetail(int id) async {
    emit(SeriesDetailInitial());
    final result = await getSeriesDetail.execute(id);

    result.fold(
      (failure) {
        emit(SeriesDetailError(failure.message));
      },
      (data) {
        emit(SeriesDetailSuccess(seriesDetail: data));
        fetchRecommendations(id);
      },
    );
  }

  Future<void> fetchRecommendations(int id) async {
    emit((state as SeriesDetailSuccess).loading());
    final result = await getSeriesRecommendations.execute(id);

    result.fold(
      (failure) {
        emit((state as SeriesDetailSuccess).failed(failure.message));
      },
      (recommendations) {
        emit((state as SeriesDetailSuccess).success(recommendations));
      },
    );
  }
}
