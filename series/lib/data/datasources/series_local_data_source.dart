import 'package:core/core.dart';

abstract class SeriesLocalDataSource {
  Future<String> insertWatchlist(WatchlistTable series);
  Future<String> removeWatchlist(WatchlistTable series);
  Future<WatchlistTable?> getSeriesById(int id);
  Future<List<WatchlistTable>> getWatchlistSeries();
}

class SeriesLocalDataSourceImpl implements SeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  SeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(WatchlistTable series) async {
    try {
      await databaseHelper.insertWatchlist(series);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(WatchlistTable series) async {
    try {
      await databaseHelper.removeWatchlist(series);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<WatchlistTable?> getSeriesById(int id) async {
    final result = await databaseHelper.getSeriesById(id);
    if (result != null) {
      return WatchlistTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<WatchlistTable>> getWatchlistSeries() async {
    final result = await databaseHelper.getWatchlistSeries();
    return result.map((data) => WatchlistTable.fromMap(data)).toList();
  }
}
