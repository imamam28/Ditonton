// Mocks generated by Mockito 5.1.0 from annotations
// in series/test/presentation/bloc/series_detail_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:core/core.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:series/domain/repositories/series_repository.dart' as _i2;
import 'package:series/domain/usecases/get_series_detail.dart' as _i4;
import 'package:series/domain/usecases/get_series_recommendations.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeSeriesRepository_0 extends _i1.Fake implements _i2.SeriesRepository {
}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetSeriesDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesDetail extends _i1.Mock implements _i4.GetSeriesDetail {
  MockGetSeriesDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SeriesRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository_0()) as _i2.SeriesRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i6.SeriesDetail>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, _i6.SeriesDetail>>.value(
              _FakeEither_1<_i6.Failure, _i6.SeriesDetail>())) as _i5
          .Future<_i3.Either<_i6.Failure, _i6.SeriesDetail>>);
}

/// A class which mocks [GetSeriesRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesRecommendations extends _i1.Mock
    implements _i7.GetSeriesRecommendations {
  MockGetSeriesRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SeriesRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository_0()) as _i2.SeriesRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i6.Series>>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i6.Series>>>.value(
              _FakeEither_1<_i6.Failure, List<_i6.Series>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i6.Series>>>);
}
