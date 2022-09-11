import 'dart:developer';

import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart' as movie;
import 'package:series/series.dart' as series;

import 'injection.dart' as di;
import 'presentation/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.microtask(_openApp);
    super.initState();
  }

  Future<void> _openApp() async {
    try {
      await FirebaseAnalytics.instance.logEvent(name: "open_app");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<movie.MovieDetailCubit>()),
        BlocProvider(create: (_) => di.locator<movie.WatchlistCubit>()),
        BlocProvider(create: (_) => di.locator<movie.NowPlayingCubit>()),
        BlocProvider(create: (_) => di.locator<movie.PopularCubit>()),
        BlocProvider(create: (_) => di.locator<movie.TopRatedCubit>()),
        BlocProvider(create: (_) => di.locator<movie.SearchCubit>()),
        BlocProvider(create: (_) => di.locator<movie.WatchListCubit>()),
        BlocProvider(create: (_) => di.locator<series.SeriesDetailCubit>()),
        BlocProvider(create: (_) => di.locator<series.WatchlistCubit>()),
        BlocProvider(create: (_) => di.locator<series.OnAirCubit>()),
        BlocProvider(create: (_) => di.locator<series.PopularCubit>()),
        BlocProvider(create: (_) => di.locator<series.TopRatedCubit>()),
        BlocProvider(create: (_) => di.locator<series.SearchCubit>()),
        BlocProvider(create: (_) => di.locator<series.WatchListCubit>()),
      ],
      child: MaterialApp(
        title: 'Ditonton',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        initialRoute: homeRoute,
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case homeRoute:
              return MaterialPageRoute(builder: (_) => HomePage());
            case movieNowPlayingRoute:
              return CupertinoPageRoute(
                  builder: (_) => movie.NowPlayingMoviesPage());
            case moviePopularRoute:
              return CupertinoPageRoute(
                  builder: (_) => movie.PopularMoviesPage());
            case movieTopRatedRoute:
              return CupertinoPageRoute(
                  builder: (_) => movie.TopRatedMoviesPage());
            case movieSearchRoute:
              return CupertinoPageRoute(
                  builder: (_) => movie.MovieSearchPage());
            case movieWatchlistRoute:
              return CupertinoPageRoute(
                  builder: (_) => movie.MovieWatchlistPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => movie.MovieDetailPage(id: id),
                settings: settings,
              );
            case seriesOnAirRoute:
              return CupertinoPageRoute(
                  builder: (_) => series.OnAirSeriesPage());
            case seriesPopularRoute:
              return CupertinoPageRoute(
                  builder: (_) => series.PopularSeriesPage());
            case seriesTopRatedRoute:
              return CupertinoPageRoute(
                  builder: (_) => series.TopRatedSeriesPage());
            case seriesSearchRoute:
              return CupertinoPageRoute(
                  builder: (_) => series.SeriesSearchPage());
            case seriesWatchlistRoute:
              return CupertinoPageRoute(
                  builder: (_) => series.SeriesWatchlistPage());
            case seriesDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => series.SeriesDetailPage(id: id),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(child: Text('Page not found :(')),
                );
              });
          }
        },
      ),
    );
  }
}
