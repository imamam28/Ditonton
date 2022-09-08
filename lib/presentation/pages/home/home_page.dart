import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:series/series.dart';
import 'package:about/about.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPage = "Movies";
  Map<String, Widget> _pages = {
    "Movies": HomeMoviePage(),
    "Series": HomeSeriesPage(),
    "About": AboutPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                setState(() => _selectedPage = 'Movies');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv_rounded),
              title: Text('Series'),
              onTap: () {
                setState(() => _selectedPage = 'Series');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About'),
              onTap: () {
                setState(() => _selectedPage = 'About');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_selectedPage),
        actions: [
          if (_selectedPage == "Movies" || _selectedPage == "Series") ...[
            IconButton(
              onPressed: () {
                if (_selectedPage == "Movies") {
                  Navigator.pushNamed(context, movieWatchlistRoute);
                } else if (_selectedPage == "Series") {
                  Navigator.pushNamed(context, seriesWatchlistRoute);
                }
              },
              icon: Icon(Icons.system_update_tv_outlined),
            ),
            IconButton(
              onPressed: () {
                if (_selectedPage == "Movies") {
                  Navigator.pushNamed(context, movieSearchRoute);
                } else if (_selectedPage == "Series") {
                  Navigator.pushNamed(context, seriesSearchRoute);
                }
              },
              icon: Icon(Icons.search),
            ),
          ],
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _pages[_selectedPage],
      ),
    );
  }
}
