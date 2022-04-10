import 'package:core/domain/entities/series.dart';
import 'package:equatable/equatable.dart';

class SeriesModel extends Equatable {
  final String? backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final double? voteAverage;
  final int voteCount;

  const SeriesModel({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'first_air_date': firstAirDate,
      'genre_ids': genreIds,
      'id': id,
      'name': name,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'] ?? '',
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count']?.toInt() ?? 0,
    );
  }

  Series toEntity() {
    return Series(
        id: id,
        backdropPath: backdropPath,
        firstAirDate: firstAirDate,
        genreIds: genreIds,
        name: name,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }

  @override
  String toString() {
    return 'Results(backdrop_path: $backdropPath, first_air_date: $firstAirDate, genre_ids: $genreIds, id: $id, name: $name, origin_country: $originCountry, original_language: $originalLanguage, original_name: $originalName, overview: $overview, popularity: $popularity, poster_path: $posterPath, vote_average: $voteAverage, vote_count: $voteCount)';
  }

  @override
  List<Object?> get props {
    return [
      backdropPath,
      firstAirDate,
      genreIds,
      id,
      name,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      voteAverage,
      voteCount,
    ];
  }
}
