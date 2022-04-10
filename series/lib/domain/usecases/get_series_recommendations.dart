import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:series/domain/repositories/series_repository.dart';

class GetSeriesRecommendations {
  final SeriesRepository repository;

  GetSeriesRecommendations(this.repository);

  Future<Either<Failure, List<Series>>> execute(int id) {
    return repository.getSeriesRecommendations(id);
  }
}
