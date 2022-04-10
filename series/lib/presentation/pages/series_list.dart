import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SeriesList extends StatelessWidget {
  final List<Series> series;

  SeriesList(this.series);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final seriesData = series[index];
          return PosterImage(
            imagePath: '$baseImageUrl${seriesData.posterPath}',
            height: 200,
            action: () {
              Navigator.pushNamed(
                context,
                seriesDetailRoute,
                arguments: seriesData.id,
              );
            },
          );
        },
        itemCount: series.length,
      ),
    );
  }
}
