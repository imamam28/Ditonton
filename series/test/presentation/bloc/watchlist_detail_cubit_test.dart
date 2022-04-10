import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/domain.dart';
import 'package:series/presentation/bloc/series_detail/watchlist/watchlist_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatusSeries,
  SaveWatchlistSeries,
  RemoveWatchlistSeries,
])
void main() {
  late WatchlistCubit watchlistCubit;
  late MockGetWatchListStatusSeries mockGetWatchListStatusSeries;
  late MockSaveWatchlistSeries mockSaveWatchlistSeries;
  late MockRemoveWatchlistSeries mockRemoveWatchlistSeries;

  setUp(() {
    mockGetWatchListStatusSeries = MockGetWatchListStatusSeries();
    mockSaveWatchlistSeries = MockSaveWatchlistSeries();
    mockRemoveWatchlistSeries = MockRemoveWatchlistSeries();
    watchlistCubit = WatchlistCubit(mockGetWatchListStatusSeries,
        mockSaveWatchlistSeries, mockRemoveWatchlistSeries);
  });

  final tId = 1;

  test('initial state should be WatchlistState.initial()', () {
    expect(watchlistCubit.state, WatchlistState.initial());
  });

  blocTest<WatchlistCubit, WatchlistState>(
    'should get the watchlist status',
    build: () {
      when(mockGetWatchListStatusSeries.execute(tId))
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
      verify(mockGetWatchListStatusSeries.execute(tId));
    },
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'should execute save watchlist when function called',
    build: () {
      when(mockSaveWatchlistSeries.execute(testSeriesDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      return watchlistCubit;
    },
    act: (bloc) => bloc.addWatchlist(testSeriesDetail),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistState.initial().copyWith(
          isAddedWatchlist: true,
          isSuccess: true,
          message: 'Added to Watchlist'),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistSeries.execute(testSeriesDetail));
    },
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'should execute remove watchlist when function called',
    build: () {
      when(mockRemoveWatchlistSeries.execute(testSeriesDetail))
          .thenAnswer((_) async => Right('Removed from Watchlist'));
      return watchlistCubit;
    },
    act: (bloc) => bloc.removeFromWatchlist(testSeriesDetail),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistState.initial().copyWith(
          isAddedWatchlist: false,
          isSuccess: true,
          message: 'Removed from Watchlist'),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistSeries.execute(testSeriesDetail));
    },
  );
}
