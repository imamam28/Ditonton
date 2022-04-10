import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/domain.dart';
import 'package:series/presentation/bloc/bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'series_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetSeriesDetail,
  GetSeriesRecommendations,
])
void main() {
  late SeriesDetailCubit seriesDetailCubit;
  late MockGetSeriesDetail mockGetSeriesDetail;
  late MockGetSeriesRecommendations mockGetSeriesRecommendations;

  setUp(() {
    mockGetSeriesDetail = MockGetSeriesDetail();
    mockGetSeriesRecommendations = MockGetSeriesRecommendations();
    seriesDetailCubit =
        SeriesDetailCubit(mockGetSeriesDetail, mockGetSeriesRecommendations);
  });

  final tId = 1;
  final tSeries = Series(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    name: 'name',
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    popularity: 100,
    voteAverage: 9,
    voteCount: 100,
    firstAirDate: '2022-07-09',
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'originalName',
  );

  final tSeriesList = <Series>[tSeries];

  test('initial state should be SeriesDetailInitial', () {
    expect(seriesDetailCubit.state, SeriesDetailInitial());
  });

  blocTest<SeriesDetailCubit, SeriesDetailState>(
    'Should emit [SeriesDetailInitial, SeriesDetailSuccess] when data is gotten successfully and continue to get recommendations then successful',
    build: () {
      when(mockGetSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testSeriesDetail));
      when(mockGetSeriesRecommendations.execute(testSeriesDetail.id))
          .thenAnswer((_) async => Right(tSeriesList));
      return seriesDetailCubit;
    },
    act: (bloc) => bloc.fetchSeriesDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SeriesDetailInitial(),
      SeriesDetailSuccess(seriesDetail: testSeriesDetail),
      SeriesDetailSuccess(seriesDetail: testSeriesDetail).loading(),
      SeriesDetailSuccess(seriesDetail: testSeriesDetail)
          .loading()
          .success(tSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetSeriesDetail.execute(tId));
      verify(mockGetSeriesRecommendations.execute(testSeriesDetail.id));
    },
  );

  blocTest<SeriesDetailCubit, SeriesDetailState>(
    'Should emit [SeriesDetailInitial, SeriesDetailSuccess] when data is gotten successfully and continue to get recommendations then unsuccessful',
    build: () {
      when(mockGetSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testSeriesDetail));
      when(mockGetSeriesRecommendations.execute(testSeriesDetail.id))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return seriesDetailCubit;
    },
    act: (bloc) => bloc.fetchSeriesDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SeriesDetailInitial(),
      SeriesDetailSuccess(seriesDetail: testSeriesDetail),
      SeriesDetailSuccess(seriesDetail: testSeriesDetail).loading(),
      SeriesDetailSuccess(seriesDetail: testSeriesDetail)
          .loading()
          .failed('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetSeriesDetail.execute(tId));
      verify(mockGetSeriesRecommendations.execute(testSeriesDetail.id));
    },
  );

  blocTest<SeriesDetailCubit, SeriesDetailState>(
    'Should emit [SeriesDetailInitial, SeriesDetailError] when data is gotten unsuccessful',
    build: () {
      when(mockGetSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return seriesDetailCubit;
    },
    act: (bloc) => bloc.fetchSeriesDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SeriesDetailInitial(),
      SeriesDetailError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetSeriesDetail.execute(tId));
    },
  );
}
