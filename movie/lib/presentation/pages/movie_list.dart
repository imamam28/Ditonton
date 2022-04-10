import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return PosterImage(
            imagePath: '$baseImageUrl${movie.posterPath}',
            height: 200,
            action: () {
              Navigator.pushNamed(
                context,
                movieDetailRoute,
                arguments: movie.id,
              );
            },
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
