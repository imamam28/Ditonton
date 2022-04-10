import 'package:core/domain/entities/seasons.dart';
import 'package:equatable/equatable.dart';

class SeasonsModel extends Equatable {
  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  const SeasonsModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'air_date': airDate,
      'episode_count': episodeCount,
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': posterPath,
      'season_number': seasonNumber,
    };
  }

  factory SeasonsModel.fromJson(Map<String, dynamic> json) {
    return SeasonsModel(
      airDate: json['air_date'] ?? '',
      episodeCount: json['episode_count']?.toInt() ?? 0,
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      seasonNumber: json['season_number']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'SeasonsModel(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber)';
  }

  Seasons toEntity() {
    return Seasons(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }

  @override
  List<Object> get props {
    return [
      airDate,
      episodeCount,
      id,
      name,
      overview,
      posterPath,
      seasonNumber,
    ];
  }
}
