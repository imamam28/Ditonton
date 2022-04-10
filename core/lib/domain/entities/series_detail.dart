import 'package:equatable/equatable.dart';

import 'episode_to_air.dart';
import 'genre.dart';
import 'seasons.dart';

class SeriesDetail extends Equatable {
  final bool adult;
  final String? backdropPath;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final String? lastAirDate;
  final EpisodeToAir? lastEpisodeToAir;
  final String name;
  final EpisodeToAir? nextEpisodeToAir;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<Seasons> seasons;
  final String status;
  final String tagline;
  final double voteAverage;
  final int voteCount;
  const SeriesDetail({
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
