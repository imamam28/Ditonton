import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<Series>>> getOnAirSeries();
  Future<Either<Failure, List<Series>>> getPopularSeries();
  Future<Either<Failure, List<Series>>> getTopRatedSeries();
  Future<Either<Failure, SeriesDetail>> getSeriesDetail(int id);
  Future<Either<Failure, List<Series>>> getSeriesRecommendations(int id);
  Future<Either<Failure, List<Series>>> searchSeries(String query);
  Future<Either<Failure, String>> saveWatchlist(SeriesDetail series);
  Future<Either<Failure, String>> removeWatchlist(SeriesDetail series);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<Series>>> getWatchlistSeries();
}
