import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';

export 'watchlist/watchlist_cubit.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  MovieDetailCubit(this.getMovieDetail, this.getMovieRecommendations)
      : super(MovieDetailInitial());

  Future<void> fetchMovieDetail(int id) async {
    emit(MovieDetailInitial());
    final result = await getMovieDetail.execute(id);

    result.fold(
      (failure) {
        emit(MovieDetailError(failure.message));
      },
      (data) {
        emit(MovieDetailSuccess(movieDetail: data));
        fetchRecommendations(id);
      },
    );
  }

  Future<void> fetchRecommendations(int id) async {
    emit((state as MovieDetailSuccess).loading());
    final result = await getMovieRecommendations.execute(id);

    result.fold(
      (failure) {
        emit((state as MovieDetailSuccess).failed(failure.message));
      },
      (recommendations) {
        emit((state as MovieDetailSuccess).success(recommendations));
      },
    );
  }
}
