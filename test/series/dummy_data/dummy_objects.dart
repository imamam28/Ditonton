import 'package:core/core.dart';

final testSeries = Series(
  backdropPath: "/oKt4J3TFjWirVwBqoHyIvv5IImd.jpg",
  firstAirDate: "2019-06-16",
  genreIds: [18],
  id: 85552,
  name: "Euphoria",
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "Euphoria",
  overview:
      "A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.",
  popularity: 4695.201,
  posterPath: "/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg",
  voteAverage: 8.4,
  voteCount: 7136,
);

final testSeriesList = [testSeries];

final testSeriesDetail = SeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  homepage: 'releaseDate',
  name: 'name',
  voteAverage: 1,
  voteCount: 1,
  tagline: 'tagline',
  inProduction: true,
  firstAirDate: '2019-06-16',
  lastAirDate: '2019-06-16',
  lastEpisodeToAir: EpisodeToAir(
      airDate: '2019-06-16',
      episodeNumber: 1,
      id: 1,
      name: 'name',
      overview: 'overview',
      stillPath: 'stillPath',
      seasonNumber: 1,
      voteAverage: 1,
      voteCount: 1),
  nextEpisodeToAir: null,
  numberOfEpisodes: 12,
  numberOfSeasons: 1,
  originalLanguage: 'en',
  originCountry: ['US'],
  popularity: 1,
  seasons: [
    Seasons(
        airDate: '2019-06-16',
        episodeCount: 12,
        id: 1,
        name: 'name',
        overview: 'overview',
        posterPath: 'posterPath',
        seasonNumber: 1)
  ],
  status: 'status',
);

final testWatchlistSeries = Series.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testWatchlistSeriesLocal = WatchlistTable(
  id: 1,
  title: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
  type: 'series',
);

final testSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'name',
  'type': 'series',
};
