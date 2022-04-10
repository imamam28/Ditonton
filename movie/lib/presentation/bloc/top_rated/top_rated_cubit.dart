import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final GetTopRatedMovies getTopRatedMovies;
  TopRatedCubit(this.getTopRatedMovies) : super(TopRatedInitial());

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedInitial());
    final result = await getTopRatedMovies.execute();

    result.fold(
      (failure) {
        emit(TopRatedError(failure.message));
      },
      (moviesData) {
        emit(TopRatedSuccess(moviesData));
      },
    );
  }
}
