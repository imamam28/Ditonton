// Mocks generated by Mockito 5.1.0 from annotations
// in movie/test/presentation/bloc/watchlist_detail_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/domain/repositories/movie_repository.dart' as _i2;
import 'package:movie/domain/usecases/get_watchlist_status_movie.dart' as _i4;
import 'package:movie/domain/usecases/remove_watchlist_movie.dart' as _i8;
import 'package:movie/domain/usecases/save_watchlist_movie.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMovieRepository_0 extends _i1.Fake implements _i2.MovieRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetWatchListStatusMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusMovie extends _i1.Mock
    implements _i4.GetWatchListStatusMovie {
  MockGetWatchListStatusMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveWatchlistMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistMovie extends _i1.Mock
    implements _i6.SaveWatchlistMovie {
  MockSaveWatchlistMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, String>> execute(_i7.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i5.Future<_i3.Either<_i7.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistMovie extends _i1.Mock
    implements _i8.RemoveWatchlistMovie {
  MockRemoveWatchlistMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, String>> execute(_i7.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i5.Future<_i3.Either<_i7.Failure, String>>);
}
