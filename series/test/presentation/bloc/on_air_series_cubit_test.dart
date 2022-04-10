import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/domain.dart';
import 'package:series/presentation/bloc/bloc.dart';

import 'on_air_series_cubit_test.mocks.dart';

@GenerateMocks([GetOnAirSeries])
void main() {
  late OnAirCubit onAirCubit;
  late MockGetOnAirSeries mockGetOnAirSeries;

  setUp(() {
    mockGetOnAirSeries = MockGetOnAirSeries();
    onAirCubit = OnAirCubit(mockGetOnAirSeries);
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

  test('initial state should be OnAirInitial', () {
    expect(onAirCubit.state, OnAirInitial());
  });

  blocTest<OnAirCubit, OnAirState>(
    'Should emit [OnAirInitial, OnAirSuccess] when data is gotten successfully',
    build: () {
      when(mockGetOnAirSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      return onAirCubit;
    },
    act: (bloc) => bloc.fetchOnAirSeries(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      OnAirInitial(),
      OnAirSuccess(tSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetOnAirSeries.execute());
    },
  );

  blocTest<OnAirCubit, OnAirState>(
    'Should emit [OnAirInitial, OnAirError] when data is gotten unsuccessful',
    build: () {
      when(mockGetOnAirSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return onAirCubit;
    },
    act: (bloc) => bloc.fetchOnAirSeries(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      OnAirInitial(),
      OnAirError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetOnAirSeries.execute());
    },
  );
}
