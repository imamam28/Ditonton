import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/domain.dart';
import 'package:movie/presentation/bloc/now_playing/now_playing_cubit.dart';

import 'now_playing_movies_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowPlayingCubit nowPlayingCubit;
  late MockGetNowPlayingMovies mockGetNowPlayingMoviesMovies;

  setUp(() {
    mockGetNowPlayingMoviesMovies = MockGetNowPlayingMovies();
    nowPlayingCubit = NowPlayingCubit(mockGetNowPlayingMoviesMovies);
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieList = <Movie>[tMovie];

  test('initial state should be NowPlayingInitial', () {
    expect(nowPlayingCubit.state, NowPlayingInitial());
  });

  blocTest<NowPlayingCubit, NowPlayingState>(
    'Should emit [NowPlayingInitial, NowPlayingSuccess] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingMoviesMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return nowPlayingCubit;
    },
    act: (bloc) => bloc.fetchNowPlayingMovies(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowPlayingInitial(),
      NowPlayingSuccess(tMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMoviesMovies.execute());
    },
  );

  blocTest<NowPlayingCubit, NowPlayingState>(
    'Should emit [NowPlayingInitial, NowPlayingError] when data is gotten unsuccessful',
    build: () {
      when(mockGetNowPlayingMoviesMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return nowPlayingCubit;
    },
    act: (bloc) => bloc.fetchNowPlayingMovies(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowPlayingInitial(),
      NowPlayingError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMoviesMovies.execute());
    },
  );
}
