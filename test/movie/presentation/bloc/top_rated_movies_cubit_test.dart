import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/domain.dart';
import 'package:movie/presentation/bloc/top_rated/top_rated_cubit.dart';

import 'top_rated_movies_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedCubit topRatedCubit;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedCubit = TopRatedCubit(mockGetTopRatedMovies);
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

  test('initial state should be TopRatedInitial', () {
    expect(topRatedCubit.state, TopRatedInitial());
  });

  blocTest<TopRatedCubit, TopRatedState>(
    'Should emit [TopRatedInitial, TopRatedSuccess] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return topRatedCubit;
    },
    act: (bloc) => bloc.fetchTopRatedMovies(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedInitial(),
      TopRatedSuccess(tMovieList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<TopRatedCubit, TopRatedState>(
    'Should emit [TopRatedInitial, TopRatedError] when data is gotten unsuccessful',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topRatedCubit;
    },
    act: (bloc) => bloc.fetchTopRatedMovies(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedInitial(),
      TopRatedError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
