import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/domain.dart';
import 'package:movie/presentation/bloc/movie_detail/watchlist/watchlist_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatusMovie,
  SaveWatchlistMovie,
  RemoveWatchlistMovie,
])
void main() {
  late WatchlistCubit watchlistCubit;
  late MockGetWatchListStatusMovie mockGetWatchListStatusMovie;
  late MockSaveWatchlistMovie mockSaveWatchlistMovie;
  late MockRemoveWatchlistMovie mockRemoveWatchlistMovie;

  setUp(() {
    mockGetWatchListStatusMovie = MockGetWatchListStatusMovie();
    mockSaveWatchlistMovie = MockSaveWatchlistMovie();
    mockRemoveWatchlistMovie = MockRemoveWatchlistMovie();
    watchlistCubit = WatchlistCubit(mockGetWatchListStatusMovie,
        mockSaveWatchlistMovie, mockRemoveWatchlistMovie);
  });

  final tId = 1;

  test('initial state should be WatchlistState.initial()', () {
    expect(watchlistCubit.state, WatchlistState.initial());
  });

  blocTest<WatchlistCubit, WatchlistState>(
    'should get the watchlist status',
    build: () {
      when(mockGetWatchListStatusMovie.execute(tId))
          .thenAnswer((_) async => true);
      return watchlistCubit;
    },
    act: (bloc) => bloc.loadWatchlistStatus(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistState.initial(),
      WatchlistState.initial().copyWith(isAddedWatchlist: true),
    ],
    verify: (bloc) {
      verify(mockGetWatchListStatusMovie.execute(tId));
    },
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'should execute save watchlist when function called',
    build: () {
      when(mockSaveWatchlistMovie.execute(testMovieDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      return watchlistCubit;
    },
    act: (bloc) => bloc.addWatchlist(testMovieDetail),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistState.initial().copyWith(
          isAddedWatchlist: true,
          isSuccess: true,
          message: 'Added to Watchlist'),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistMovie.execute(testMovieDetail));
    },
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'should execute remove watchlist when function called',
    build: () {
      when(mockRemoveWatchlistMovie.execute(testMovieDetail))
          .thenAnswer((_) async => Right('Removed to Watchlist'));
      return watchlistCubit;
    },
    act: (bloc) => bloc.removeFromWatchlist(testMovieDetail),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistState.initial().copyWith(
          isAddedWatchlist: false,
          isSuccess: true,
          message: 'Removed to Watchlist'),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistMovie.execute(testMovieDetail));
    },
  );
}
