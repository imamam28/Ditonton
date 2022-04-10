import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/domain.dart';
import 'package:movie/presentation/bloc/search/search_cubit.dart';

import 'search_movies_cubit_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late SearchCubit searchCubit;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchCubit = SearchCubit(mockSearchMovies);
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'Spiderman',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tQuery = 'spiderman';
  final tMovieList = <Movie>[tMovie];

  test('initial state should be SearchInitial', () {
    expect(searchCubit.state, SearchInitial());
  });

  blocTest<SearchCubit, SearchState>(
    'Should emit [SearchInitial, SearchSuccess] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(tQuery))
          .thenAnswer((_) async => Right(tMovieList));
      return searchCubit;
    },
    act: (bloc) => bloc.fetchSearch(tQuery),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SearchInitial(),
      SearchSuccess(tMovieList),
    ],
    verify: (bloc) {
      verify(mockSearchMovies.execute(tQuery));
    },
  );

  blocTest<SearchCubit, SearchState>(
    'Should emit [SearchInitial, SearchError] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(tQuery))
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
      verify(mockSearchMovies.execute(tQuery));
    },
  );
}
