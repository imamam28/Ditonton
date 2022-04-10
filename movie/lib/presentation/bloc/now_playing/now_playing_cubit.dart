import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  NowPlayingCubit(this.getNowPlayingMovies) : super(NowPlayingInitial());

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingInitial());
    final result = await getNowPlayingMovies.execute();

    result.fold(
      (failure) {
        emit(NowPlayingError(failure.message));
      },
      (moviesData) {
        emit(NowPlayingSuccess(moviesData));
      },
    );
  }
}
