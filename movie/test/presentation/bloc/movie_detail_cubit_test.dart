import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/domain.dart';
import 'package:movie/presentation/bloc/bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
])
void main() {
  late MovieDetailCubit movieDetailCubit;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    movieDetailCubit =
        MovieDetailCubit(mockGetMovieDetail, mockGetMovieRecommendations);
  });

  final tId = 1;
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

  test('initial state should be MovieDetailInitial', () {
    expect(movieDetailCubit.state, MovieDetailInitial());
  });

  blocTest<MovieDetailCubit, MovieDetailState>(
    'Should emit [MovieDetailInitial, MovieDetailSuccess] when data is gotten successfully and continue to get recommendations then successful',
    build: () {
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(testMovieDetail.id))
          .thenAnswer((_) async => Right(tMovieList));
      return movieDetailCubit;
    },
    act: (bloc) => bloc.fetchMovieDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieDetailInitial(),
      MovieDetailSuccess(movieDetail: testMovieDetail),
      MovieDetailSuccess(movieDetail: testMovieDetail).loading(),
      MovieDetailSuccess(movieDetail: testMovieDetail)
          .loading()
          .success(tMovieList),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(tId));
      verify(mockGetMovieRecommendations.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailCubit, MovieDetailState>(
    'Should emit [MovieDetailInitial, MovieDetailSuccess] when data is gotten successfully and continue to get recommendations then unsuccessful',
    build: () {
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(testMovieDetail.id))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieDetailCubit;
    },
    act: (bloc) => bloc.fetchMovieDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieDetailInitial(),
      MovieDetailSuccess(movieDetail: testMovieDetail),
      MovieDetailSuccess(movieDetail: testMovieDetail).loading(),
      MovieDetailSuccess(movieDetail: testMovieDetail)
          .loading()
          .failed('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(tId));
      verify(mockGetMovieRecommendations.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailCubit, MovieDetailState>(
    'Should emit [MovieDetailInitial, MovieDetailError] when data is gotten unsuccessful',
    build: () {
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieDetailCubit;
    },
    act: (bloc) => bloc.fetchMovieDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieDetailInitial(),
      MovieDetailError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(tId));
    },
  );
}
