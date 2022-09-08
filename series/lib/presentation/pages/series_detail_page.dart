import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:series/presentation/bloc/series_detail/series_detail_cubit.dart';

class SeriesDetailPage extends StatefulWidget {
  final int id;
  SeriesDetailPage({required this.id});

  @override
  _SeriesDetailPageState createState() => _SeriesDetailPageState();
}

class _SeriesDetailPageState extends State<SeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<SeriesDetailCubit>(context).fetchSeriesDetail(widget.id);
      BlocProvider.of<WatchlistCubit>(context).loadWatchlistStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SeriesDetailCubit, SeriesDetailState>(
        builder: (context, state) {
          if (state is SeriesDetailInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SeriesDetailSuccess) {
            return SafeArea(child: DetailContent(state));
          } else if (state is SeriesDetailError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final SeriesDetailSuccess state;

  DetailContent(this.state);

  SeriesDetail get series => state.seriesDetail;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${series.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(series.name, style: kHeading5),
                            BlocConsumer<WatchlistCubit, WatchlistState>(
                              listener: (context, state) {
                                if (state.message != null) {
                                  if (state.isSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(state.message!)));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(state.message!),
                                          );
                                        });
                                  }
                                }
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (!state.isAddedWatchlist) {
                                      BlocProvider.of<WatchlistCubit>(context)
                                          .addWatchlist(series);
                                    } else {
                                      BlocProvider.of<WatchlistCubit>(context)
                                          .removeFromWatchlist(series);
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      state.isAddedWatchlist
                                          ? Icon(Icons.check)
                                          : Icon(Icons.add),
                                      Text('Watchlist'),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Text(series.genres.map((e) => e.name).join(', ')),
                            Text("First Airing Date : ${series.firstAirDate}"),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: series.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${series.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text('Overview', style: kHeading6),
                            Text(series.overview),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text('Episodes', style: kHeading6),
                                SizedBox(width: 8),
                                Text('(Last Air Date : ${series.lastAirDate})'),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: kMikadoYellow,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              child: Text(
                                'Total Episodes : ${series.numberOfEpisodes}',
                                style: kSubtitle.copyWith(color: kRichBlack),
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                if (series.lastEpisodeToAir != null)
                                  PosterImage(
                                    imagePath:
                                        'https://image.tmdb.org/t/p/w500${series.lastEpisodeToAir!.stillPath}',
                                    label:
                                        "Last Episode ${series.lastEpisodeToAir!.episodeNumber} : ${series.lastEpisodeToAir!.name.isNotEmpty ? series.lastEpisodeToAir!.name : '-'}",
                                  ),
                                if (series.nextEpisodeToAir != null) ...[
                                  SizedBox(width: 8),
                                  PosterImage(
                                    imagePath:
                                        'https://image.tmdb.org/t/p/w500${series.nextEpisodeToAir!.stillPath}',
                                    label:
                                        "Next Episode ${series.nextEpisodeToAir!.episodeNumber} : ${series.nextEpisodeToAir!.name.isNotEmpty ? series.nextEpisodeToAir!.name : '-'}",
                                  )
                                ],
                              ],
                            ),
                            SizedBox(height: 16),
                            Text('Seasons', style: kHeading6),
                            Container(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final season = series.seasons[index];
                                  return PosterImage(
                                    imagePath:
                                        'https://image.tmdb.org/t/p/w500${season.posterPath}',
                                    label: season.name,
                                  );
                                },
                                itemCount: series.seasons.length,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text('Recommendations', style: kHeading6),
                            Builder(
                              builder: (context) {
                                if (state.isLoadingRecommendation) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state.errorMessage != null) {
                                  return Text(state.errorMessage!);
                                } else {
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final series =
                                            state.recommendations![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                seriesDetailRoute,
                                                arguments: series.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${series.posterPath}',
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: state.recommendations!.length,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}
