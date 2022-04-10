import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/domain.dart';
import 'package:series/presentation/bloc/search/search_cubit.dart';

import 'search_series_cubit_test.mocks.dart';

@GenerateMocks([SearchSeries])
void main() {
  late SearchCubit searchCubit;
  late MockSearchSeries mockSearchSeries;

  setUp(() {
    mockSearchSeries = MockSearchSeries();
    searchCubit = SearchCubit(mockSearchSeries);
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

  final tQuery = 'spiderman';
  final tSeriesList = <Series>[tSeries];

  test('initial state should be SearchInitial', () {
    expect(searchCubit.state, SearchInitial());
  });

  blocTest<SearchCubit, SearchState>(
    'Should emit [SearchInitial, SearchSuccess] when data is gotten successfully',
    build: () {
      when(mockSearchSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tSeriesList));
      return searchCubit;
    },
    act: (bloc) => bloc.fetchSearch(tQuery),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SearchInitial(),
      SearchSuccess(tSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchSeries.execute(tQuery));
    },
  );

  blocTest<SearchCubit, SearchState>(
    'Should emit [SearchInitial, SearchError] when data is gotten successfully',
    build: () {
      when(mockSearchSeries.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchCubit;
    },
    act: (bloc) => bloc.fetchSearch(tQuery),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SearchInitial(),
      SearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchSeries.execute(tQuery));
    },
  );
}
