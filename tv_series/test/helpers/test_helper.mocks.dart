// Mocks generated by Mockito 5.3.2 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i15;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/movies.dart' as _i13;
import 'package:sqflite/sqflite.dart' as _i12;
import 'package:tv_series/data/models/tv_detail_model.dart' as _i3;
import 'package:tv_series/data/models/tv_model.dart' as _i10;
import 'package:tv_series/data/models/tv_table.dart' as _i11;
import 'package:tv_series/domain/entities/tv.dart' as _i8;
import 'package:tv_series/domain/entities/tv_detail.dart' as _i9;
import 'package:tv_series/tv_series.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTVDetailResponse_1 extends _i1.SmartFake
    implements _i3.TVDetailResponse {
  _FakeTVDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TVRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRepository extends _i1.Mock implements _i5.TVRepository {
  MockTVRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getOnTheAirTVs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTVs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getOnTheAirTVs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getPopularTVs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTVs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getPopularTVs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTopRatedTVs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTVs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTopRatedTVs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TVDetail>> getTVDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVDetail,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.TVDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.TVDetail>(
          this,
          Invocation.method(
            #getTVDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TVDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTVRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTVRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> searchTVs(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTVs,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #searchTVs,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlist(_i9.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [tv],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
          _i9.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [tv],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getWatchlistTVs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTVs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getWatchlistTVs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
}

/// A class which mocks [TVRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRemoteDataSource extends _i1.Mock
    implements _i5.TVRemoteDataSource {
  MockTVRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i10.TVModel>> getOnTheAirTVs() => (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTVs,
          [],
        ),
        returnValue: _i6.Future<List<_i10.TVModel>>.value(<_i10.TVModel>[]),
      ) as _i6.Future<List<_i10.TVModel>>);
  @override
  _i6.Future<List<_i10.TVModel>> getPopularTVs() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTVs,
          [],
        ),
        returnValue: _i6.Future<List<_i10.TVModel>>.value(<_i10.TVModel>[]),
      ) as _i6.Future<List<_i10.TVModel>>);
  @override
  _i6.Future<List<_i10.TVModel>> getTopRatedTVs() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTVs,
          [],
        ),
        returnValue: _i6.Future<List<_i10.TVModel>>.value(<_i10.TVModel>[]),
      ) as _i6.Future<List<_i10.TVModel>>);
  @override
  _i6.Future<_i3.TVDetailResponse> getTVDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTVDetail,
          [id],
        ),
        returnValue:
            _i6.Future<_i3.TVDetailResponse>.value(_FakeTVDetailResponse_1(
          this,
          Invocation.method(
            #getTVDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.TVDetailResponse>);
  @override
  _i6.Future<List<_i10.TVModel>> getTVRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVRecommendations,
          [id],
        ),
        returnValue: _i6.Future<List<_i10.TVModel>>.value(<_i10.TVModel>[]),
      ) as _i6.Future<List<_i10.TVModel>>);
  @override
  _i6.Future<List<_i10.TVModel>> searchTVs(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTVs,
          [query],
        ),
        returnValue: _i6.Future<List<_i10.TVModel>>.value(<_i10.TVModel>[]),
      ) as _i6.Future<List<_i10.TVModel>>);
}

/// A class which mocks [TVLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVLocalDataSource extends _i1.Mock implements _i5.TVLocalDataSource {
  MockTVLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTV(_i11.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTV,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTV(_i11.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTV,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i11.TVTable?> getTVById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTVById,
          [id],
        ),
        returnValue: _i6.Future<_i11.TVTable?>.value(),
      ) as _i6.Future<_i11.TVTable?>);
  @override
  _i6.Future<List<_i11.TVTable>> getWatchlistTVs() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTVs,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TVTable>>.value(<_i11.TVTable>[]),
      ) as _i6.Future<List<_i11.TVTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i7.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i12.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i12.Database?>.value(),
      ) as _i6.Future<_i12.Database?>);
  @override
  _i6.Future<int> insertWatchlistMovie(_i13.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistMovie,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> insertWatchlistTV(_i11.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTV,
          [tv],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistMovie(_i13.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistMovie,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTV(_i11.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTV,
          [tv],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<Map<String, dynamic>?> getTVById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTVById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTVs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTVs,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i15.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i15.Uint8List>.value(_i15.Uint8List(0)),
      ) as _i6.Future<_i15.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
