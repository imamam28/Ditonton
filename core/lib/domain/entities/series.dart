import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final int id;
  final String? name;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  const Series({
    required this.id,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
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

  const Series.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
    this.backdropPath,
    this.genreIds,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.firstAirDate,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
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

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id']?.toInt() ?? 0,
      name: json['name'],
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity']?.toDouble(),
      posterPath: json['poster_path'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count']?.toInt(),
    );
  }

  @override
  String toString() {
    return 'Series(backdropPath: $backdropPath, firstAirDate: $firstAirDate, genreIds: $genreIds, id: $id, name: $name, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, voteAverage: $voteAverage, voteCount: $voteCount)';
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
