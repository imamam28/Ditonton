import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final GetPopularMovies getPopularMovies;
  PopularCubit(this.getPopularMovies) : super(PopularInitial());

  Future<void> fetchPopularMovies() async {
    emit(PopularInitial());
    final result = await getPopularMovies.execute();

    result.fold(
      (failure) {
        emit(PopularError(failure.message));
      },
      (moviesData) {
        emit(PopularSuccess(moviesData));
      },
    );
  }
}
