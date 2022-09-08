import 'dart:convert';

import 'package:core/core.dart';
import 'package:http/io_client.dart';

abstract class SeriesRemoteDataSource {
  Future<List<SeriesModel>> getOnAirSeries();
  Future<List<SeriesModel>> getPopularSeries();
  Future<List<SeriesModel>> getTopRatedSeries();
  Future<SeriesDetailResponse> getSeriesDetail(int id);
  Future<List<SeriesModel>> getSeriesRecommendations(int id);
  Future<List<SeriesModel>> searchSeries(String query);
}

class SeriesRemoteDataSourceImpl implements SeriesRemoteDataSource {
  final IOClient client;

  SeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SeriesModel>> getOnAirSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException(
        responseCode: response.statusCode,
        message: errorMessage(response.body),
      );
    }
  }

  @override
  Future<SeriesDetailResponse> getSeriesDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException(
        responseCode: response.statusCode,
        message: errorMessage(response.body),
      );
    }
  }

  @override
  Future<List<SeriesModel>> getSeriesRecommendations(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException(
        responseCode: response.statusCode,
        message: errorMessage(response.body),
      );
    }
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async {
    final response = await client.get(Uri.parse('$baseUrl/tv/popular?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException(
        responseCode: response.statusCode,
        message: errorMessage(response.body),
      );
    }
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException(
        responseCode: response.statusCode,
        message: errorMessage(response.body),
      );
    }
  }

  @override
  Future<List<SeriesModel>> searchSeries(String query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException(
        responseCode: response.statusCode,
        message: errorMessage(response.body),
      );
    }
  }

  String errorMessage(String responseBody) {
    try {
      return jsonDecode(responseBody)['status_message'] ?? responseBody;
    } catch (e) {
      return responseBody;
    }
  }
}
