import 'package:core/data/models/episode_to_air_model.dart';
import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/seasons_model.dart';
import 'package:core/domain/entities/series_detail.dart';
import 'package:equatable/equatable.dart';

class SeriesDetailResponse extends Equatable {
  final bool adult;
  final String? backdropPath;
  final String firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final String? lastAirDate;
  final EpisodeToAirModel? lastEpisodeToAir;
  final String name;
  final EpisodeToAirModel? nextEpisodeToAir;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<SeasonsModel> seasons;
  final String status;
  final String tagline;
  final double voteAverage;
  final int voteCount;
  const SeriesDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  SeriesDetail toEntity() {
    return SeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      lastAirDate: lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir?.toEntity(),
      name: name,
      nextEpisodeToAir: nextEpisodeToAir?.toEntity(),
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      seasons: seasons.map((season) => season.toEntity()).toList(),
      status: status,
      tagline: tagline,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'first_air_date': firstAirDate,
      'genres': genres.map((x) => x.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'in_production': inProduction,
      'last_air_date': lastAirDate,
      'last_episode_to_air': lastEpisodeToAir?.toJson(),
      'name': name,
      'next_episode_to_air': nextEpisodeToAir?.toJson(),
      'number_of_episodes': numberOfEpisodes,
      'number_of_seasons': numberOfSeasons,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'seasons': seasons.map((x) => x.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory SeriesDetailResponse.fromJson(Map<String, dynamic> json) {
    return SeriesDetailResponse(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'] ?? '',
      genres: List<GenreModel>.from(
          json['genres']?.map((x) => GenreModel.fromJson(x))),
      homepage: json['homepage'] ?? '',
      id: json['id']?.toInt() ?? 0,
      inProduction: json['in_production'] ?? false,
      lastAirDate: json['last_air_date'],
      lastEpisodeToAir: json['last_episode_to_air'] != null
          ? EpisodeToAirModel.fromJson(json['last_episode_to_air'])
          : null,
      name: json['name'] ?? '',
      nextEpisodeToAir: json['next_episode_to_air'] != null
          ? EpisodeToAirModel.fromJson(json['next_episode_to_air'])
          : null,
      numberOfEpisodes: json['number_of_episodes']?.toInt() ?? 0,
      numberOfSeasons: json['number_of_seasons']?.toInt() ?? 0,
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] ?? '',
      seasons: List<SeasonsModel>.from(
          json['seasons']?.map((x) => SeasonsModel.fromJson(x))),
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'SeriesDetailResponse(adult: $adult, backdropPath: $backdropPath, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, seasons: $seasons, status: $status, tagline: $tagline, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      firstAirDate,
      genres,
      homepage,
      id,
      inProduction,
      lastAirDate,
      lastEpisodeToAir,
      name,
      nextEpisodeToAir,
      numberOfEpisodes,
      numberOfSeasons,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      seasons,
      status,
      tagline,
      voteAverage,
      voteCount,
    ];
  }
}
