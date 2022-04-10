part of 'series_detail_cubit.dart';

abstract class SeriesDetailState extends Equatable {
  const SeriesDetailState();

  @override
  List<Object?> get props => [];
}

class SeriesDetailInitial extends SeriesDetailState {}

class SeriesDetailSuccess extends SeriesDetailState {
  final SeriesDetail seriesDetail;
  final bool isLoadingRecommendation;
  final String? errorMessage;
  final List<Series>? recommendations;

  SeriesDetailSuccess(
      {required this.seriesDetail,
      this.isLoadingRecommendation = false,
      this.errorMessage,
      this.recommendations});

  @override
  List<Object?> get props =>
      [seriesDetail, isLoadingRecommendation, errorMessage, recommendations];

  SeriesDetailSuccess loading() => copyWith(
      isLoadingRecommendation: true, errorMessage: null, recommendations: null);

  SeriesDetailSuccess success(List<Series> recommendations) => copyWith(
      isLoadingRecommendation: false,
      errorMessage: null,
      recommendations: recommendations);

  SeriesDetailSuccess failed(String errorMessage) => copyWith(
      isLoadingRecommendation: false,
      errorMessage: errorMessage,
      recommendations: null);

  SeriesDetailSuccess copyWith({
    SeriesDetail? seriesDetail,
    bool? isLoadingRecommendation,
    String? errorMessage,
    List<Series>? recommendations,
  }) {
    return SeriesDetailSuccess(
      seriesDetail: seriesDetail ?? this.seriesDetail,
      isLoadingRecommendation:
          isLoadingRecommendation ?? this.isLoadingRecommendation,
      errorMessage: errorMessage,
      recommendations: recommendations,
    );
  }
}

class SeriesDetailError extends SeriesDetailState {
  final String errorMessage;

  SeriesDetailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
