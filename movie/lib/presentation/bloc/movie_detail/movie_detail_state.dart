part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final MovieDetail movieDetail;
  final bool isLoadingRecommendation;
  final String? errorMessage;
  final List<Movie>? recommendations;

  MovieDetailSuccess(
      {required this.movieDetail,
      this.isLoadingRecommendation = false,
      this.errorMessage,
      this.recommendations});

  @override
  List<Object?> get props =>
      [movieDetail, isLoadingRecommendation, errorMessage, recommendations];

  MovieDetailSuccess loading() => copyWith(
      isLoadingRecommendation: true, errorMessage: null, recommendations: null);

  MovieDetailSuccess success(List<Movie> recommendations) => copyWith(
      isLoadingRecommendation: false,
      errorMessage: null,
      recommendations: recommendations);

  MovieDetailSuccess failed(String errorMessage) => copyWith(
      isLoadingRecommendation: false,
      errorMessage: errorMessage,
      recommendations: null);

  MovieDetailSuccess copyWith({
    MovieDetail? movieDetail,
    bool? isLoadingRecommendation,
    String? errorMessage,
    List<Movie>? recommendations,
  }) {
    return MovieDetailSuccess(
      movieDetail: movieDetail ?? this.movieDetail,
      isLoadingRecommendation:
          isLoadingRecommendation ?? this.isLoadingRecommendation,
      errorMessage: errorMessage,
      recommendations: recommendations,
    );
  }
}

class MovieDetailError extends MovieDetailState {
  final String errorMessage;

  MovieDetailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
