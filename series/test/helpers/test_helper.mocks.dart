// Mocks generated by Mockito 5.1.0 from annotations
// in series/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:series/data/datasources/series_local_data_source.dart' as _i8;
import 'package:series/data/datasources/series_remote_data_source.dart' as _i7;
import 'package:series/domain/repositories/series_repository.dart' as _i5;
import 'package:sqflite/sqflite.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeSeriesDetailResponse_1 extends _i1.Fake
    implements _i3.SeriesDetailResponse {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [SeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeriesRepository extends _i1.Mock implements _i5.SeriesRepository {
  MockSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i3.Failure, List<_i3.Series>>> getOnAirSeries() =>
      (super.noSuchMethod(Invocation.method(#getOnAirSeries, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Series>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Series>>())) as _i6
          .Future<_i2.Either<_i3.Failure, List<_i3.Series>>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, List<_i3.Series>>> getPopularSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularSeries, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Series>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Series>>())) as _i6
          .Future<_i2.Either<_i3.Failure, List<_i3.Series>>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, List<_i3.Series>>> getTopRatedSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedSeries, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Series>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Series>>())) as _i6
          .Future<_i2.Either<_i3.Failure, List<_i3.Series>>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, _i3.SeriesDetail>> getSeriesDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesDetail, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, _i3.SeriesDetail>>.value(
              _FakeEither_0<_i3.Failure, _i3.SeriesDetail>())) as _i6
          .Future<_i2.Either<_i3.Failure, _i3.SeriesDetail>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, List<_i3.Series>>>
      getSeriesRecommendations(int? id) => (super.noSuchMethod(
          Invocation.method(#getSeriesRecommendations, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Series>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Series>>())) as _i6
          .Future<_i2.Either<_i3.Failure, List<_i3.Series>>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, List<_i3.Series>>> searchSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchSeries, [query]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Series>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Series>>())) as _i6
          .Future<_i2.Either<_i3.Failure, List<_i3.Series>>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, String>> saveWatchlist(
          _i3.SeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [series]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i6.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, String>> removeWatchlist(
          _i3.SeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [series]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i6.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i3.Failure, List<_i3.Series>>> getWatchlistSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistSeries, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Series>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Series>>())) as _i6
          .Future<_i2.Either<_i3.Failure, List<_i3.Series>>>);
}

/// A class which mocks [SeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeriesRemoteDataSource extends _i1.Mock
    implements _i7.SeriesRemoteDataSource {
  MockSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i3.SeriesModel>> getOnAirSeries() => (super.noSuchMethod(
          Invocation.method(#getOnAirSeries, []),
          returnValue: Future<List<_i3.SeriesModel>>.value(<_i3.SeriesModel>[]))
      as _i6.Future<List<_i3.SeriesModel>>);
  @override
  _i6.Future<List<_i3.SeriesModel>> getPopularSeries() => (super.noSuchMethod(
          Invocation.method(#getPopularSeries, []),
          returnValue: Future<List<_i3.SeriesModel>>.value(<_i3.SeriesModel>[]))
      as _i6.Future<List<_i3.SeriesModel>>);
  @override
  _i6.Future<List<_i3.SeriesModel>> getTopRatedSeries() => (super.noSuchMethod(
          Invocation.method(#getTopRatedSeries, []),
          returnValue: Future<List<_i3.SeriesModel>>.value(<_i3.SeriesModel>[]))
      as _i6.Future<List<_i3.SeriesModel>>);
  @override
  _i6.Future<_i3.SeriesDetailResponse> getSeriesDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesDetail, [id]),
              returnValue: Future<_i3.SeriesDetailResponse>.value(
                  _FakeSeriesDetailResponse_1()))
          as _i6.Future<_i3.SeriesDetailResponse>);
  @override
  _i6.Future<List<_i3.SeriesModel>> getSeriesRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesRecommendations, [id]),
              returnValue:
                  Future<List<_i3.SeriesModel>>.value(<_i3.SeriesModel>[]))
          as _i6.Future<List<_i3.SeriesModel>>);
  @override
  _i6.Future<List<_i3.SeriesModel>> searchSeries(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchSeries, [query]),
              returnValue:
                  Future<List<_i3.SeriesModel>>.value(<_i3.SeriesModel>[]))
          as _i6.Future<List<_i3.SeriesModel>>);
}

/// A class which mocks [SeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeriesLocalDataSource extends _i1.Mock
    implements _i8.SeriesLocalDataSource {
  MockSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(_i3.WatchlistTable? series) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [series]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlist(_i3.WatchlistTable? series) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [series]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i3.WatchlistTable?> getSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesById, [id]),
              returnValue: Future<_i3.WatchlistTable?>.value())
          as _i6.Future<_i3.WatchlistTable?>);
  @override
  _i6.Future<List<_i3.WatchlistTable>> getWatchlistSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistSeries, []),
          returnValue: Future<List<_i3.WatchlistTable>>.value(
              <_i3.WatchlistTable>[])) as _i6.Future<List<_i3.WatchlistTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i3.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i9.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i9.Database?>.value()) as _i6.Future<_i9.Database?>);
  @override
  _i6.Future<int> insertWatchlist(_i3.WatchlistTable? watchlist) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [watchlist]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlist(_i3.WatchlistTable? watchlist) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [watchlist]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<Map<String, dynamic>?> getSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i6.Future<_i11.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
