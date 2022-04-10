import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:movie/movie.dart' as movie;
import 'package:series/series.dart' as series;

final locator = GetIt.instance;

void init() {
  // cubit movie
  locator.registerFactory(() => movie.MovieDetailCubit(locator(), locator()));
  locator.registerFactory(
      () => movie.WatchlistCubit(locator(), locator(), locator()));
  locator.registerFactory(() => movie.NowPlayingCubit(locator()));
  locator.registerFactory(() => movie.PopularCubit(locator()));
  locator.registerFactory(() => movie.TopRatedCubit(locator()));
  locator.registerFactory(() => movie.SearchCubit(locator()));
  locator.registerFactory(() => movie.WatchListCubit(locator()));
  // cubit series
  locator.registerFactory(() => series.SeriesDetailCubit(locator(), locator()));
  locator.registerFactory(
      () => series.WatchlistCubit(locator(), locator(), locator()));
  locator.registerFactory(() => series.OnAirCubit(locator()));
  locator.registerFactory(() => series.PopularCubit(locator()));
  locator.registerFactory(() => series.TopRatedCubit(locator()));
  locator.registerFactory(() => series.SearchCubit(locator()));
  locator.registerFactory(() => series.WatchListCubit(locator()));

  // use case movie
  locator.registerLazySingleton(() => movie.GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => movie.GetPopularMovies(locator()));
  locator.registerLazySingleton(() => movie.GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => movie.GetMovieDetail(locator()));
  locator.registerLazySingleton(() => movie.GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => movie.SearchMovies(locator()));
  locator.registerLazySingleton(() => movie.GetWatchListStatusMovie(locator()));
  locator.registerLazySingleton(() => movie.SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => movie.RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => movie.GetWatchlistMovies(locator()));
  // use case series
  locator.registerLazySingleton(() => series.GetOnAirSeries(locator()));
  locator.registerLazySingleton(() => series.GetPopularSeries(locator()));
  locator.registerLazySingleton(() => series.GetTopRatedSeries(locator()));
  locator.registerLazySingleton(() => series.GetSeriesDetail(locator()));
  locator
      .registerLazySingleton(() => series.GetSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => series.SearchSeries(locator()));
  locator
      .registerLazySingleton(() => series.GetWatchListStatusSeries(locator()));
  locator.registerLazySingleton(() => series.SaveWatchlistSeries(locator()));
  locator.registerLazySingleton(() => series.RemoveWatchlistSeries(locator()));
  locator.registerLazySingleton(() => series.GetWatchlistSeries(locator()));

  // repository
  locator.registerLazySingleton<movie.MovieRepository>(
    () => movie.MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<series.SeriesRepository>(
    () => series.SeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<movie.MovieRemoteDataSource>(
      () => movie.MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<movie.MovieLocalDataSource>(
      () => movie.MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<series.SeriesRemoteDataSource>(
      () => series.SeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<series.SeriesLocalDataSource>(
      () => series.SeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
