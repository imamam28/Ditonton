import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:series/domain/domain.dart';
import 'package:series/presentation/bloc/bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistSeries])
void main() {
  late WatchListCubit watchlistCubit;
  late MockGetWatchlistSeries mockGetWatchlistSeries;

  setUp(() {
    mockGetWatchlistSeries = MockGetWatchlistSeries();
    watchlistCubit = WatchListCubit(mockGetWatchlistSeries);
  });

  test('initial state should be WatchListInitial', () {
    expect(watchlistCubit.state, WatchListInitial());
  });

  blocTest<WatchListCubit, WatchListState>(
    'Should emit [WatchlistInitial, WatchlistSuccess] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistSeries.execute())
          .thenAnswer((_) async => Right([testWatchlistSeries]));
      return watchlistCubit;
    },
    act: (bloc) => bloc.fetchWatchList(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchListInitial(),
      WatchListSuccess([testWatchlistSeries]),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistSeries.execute());
    },
  );

  blocTest<WatchListCubit, WatchListState>(
    'Should emit [WatchListInitial, WatchListError] when data is gotten unsuccessful',
    build: () {
      when(mockGetWatchlistSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return watchlistCubit;
    },
    act: (bloc) => bloc.fetchWatchList(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchListInitial(),
      WatchListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistSeries.execute());
    },
  );
}
