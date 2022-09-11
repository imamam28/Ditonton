import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/usecases/get_popular_series.dart';
import 'package:series/presentation/bloc/popular/popular_cubit.dart';

import 'popular_series_cubit_test.mocks.dart';

@GenerateMocks([GetPopularSeries])
void main() {
  late PopularCubit popularCubit;
  late MockGetPopularSeries mockGetPopularSeries;

  setUp(() {
    mockGetPopularSeries = MockGetPopularSeries();
    popularCubit = PopularCubit(mockGetPopularSeries);
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

  test('initial state should be PopularInitial', () {
    expect(popularCubit.state, PopularInitial());
  });

  blocTest<PopularCubit, PopularState>(
    'Should emit [PopularInitial, PopularSuccess] when data is gotten successfully',
    build: () {
      when(mockGetPopularSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      return popularCubit;
    },
    act: (bloc) => bloc.fetchPopularSeries(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      PopularInitial(),
      PopularSuccess(tSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetPopularSeries.execute());
    },
  );

  blocTest<PopularCubit, PopularState>(
    'Should emit [PopularInitial, PopularError] when data is gotten unsuccessful',
    build: () {
      when(mockGetPopularSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return popularCubit;
    },
    act: (bloc) => bloc.fetchPopularSeries(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      PopularInitial(),
      PopularError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularSeries.execute());
    },
  );
}
