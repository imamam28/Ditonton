import 'package:equatable/equatable.dart';

class EpisodeToAir extends Equatable {
  final String airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String stillPath;
  final int seasonNumber;
  final double voteAverage;
  final int voteCount;
  const EpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.stillPath,
    required this.seasonNumber,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      airDate,
      episodeNumber,
      stillPath,
      id,
      name,
      overview,
      seasonNumber,
      voteAverage,
      voteCount,
    ];
  }
}
