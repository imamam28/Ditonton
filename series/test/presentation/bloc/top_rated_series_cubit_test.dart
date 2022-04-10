import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/domain.dart';
import 'package:series/presentation/bloc/top_rated/top_rated_cubit.dart';

import 'top_rated_series_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedSeries])
void main() {
  late TopRatedCubit topRatedCubit;
  late MockGetTopRatedSeries mockGetTopRatedSeries;

  setUp(() {
    mockGetTopRatedSeries = MockGetTopRatedSeries();
    topRatedCubit = TopRatedCubit(mockGetTopRatedSeries);
  });

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

  test('initial state should be TopRatedInitial', () {
    expect(topRatedCubit.state, TopRatedInitial());
  });

  blocTest<TopRatedCubit, TopRatedState>(
    'Should emit [TopRatedInitial, TopRatedSuccess] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      return topRatedCubit;
    },
    act: (bloc) => bloc.fetchTopRatedSeries(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedInitial(),
      TopRatedSuccess(tSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedSeries.execute());
    },
  );

  blocTest<TopRatedCubit, TopRatedState>(
    'Should emit [TopRatedInitial, TopRatedError] when data is gotten unsuccessful',
    build: () {
      when(mockGetTopRatedSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topRatedCubit;
    },
    act: (bloc) => bloc.fetchTopRatedSeries(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedInitial(),
      TopRatedError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedSeries.execute());
    },
  );
}
