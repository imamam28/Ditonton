import 'package:core/domain/entities/episode_to_air.dart';
import 'package:equatable/equatable.dart';

class EpisodeToAirModel extends Equatable {
  final String airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String stillPath;
  final int seasonNumber;
  final double voteAverage;
  final int voteCount;
  const EpisodeToAirModel({
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

  Map<String, dynamic> toJson() {
    return {
      'air_date': airDate,
      'episode_number': episodeNumber,
      'id': id,
      'name': name,
      'overview': overview,
      'still_path': stillPath,
      'season_number': seasonNumber,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory EpisodeToAirModel.fromJson(Map<String, dynamic> json) {
    return EpisodeToAirModel(
      airDate: json['air_date'] ?? '',
      episodeNumber: json['episode_number']?.toInt() ?? 0,
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      stillPath: json['still_path'] ?? '',
      seasonNumber: json['season_number']?.toInt() ?? 0,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'EpisodeToAirModel(airDate: $airDate, episodeNumber: $episodeNumber, id: $id, name: $name, overview: $overview, still_path: $stillPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  EpisodeToAir toEntity() {
    return EpisodeToAir(
      airDate: airDate,
      episodeNumber: episodeNumber,
      id: id,
      name: name,
      overview: overview,
      stillPath: stillPath,
      seasonNumber: seasonNumber,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object> get props {
    return [
      airDate,
      episodeNumber,
      id,
      name,
      overview,
      stillPath,
      seasonNumber,
      voteAverage,
      voteCount,
    ];
  }
}
