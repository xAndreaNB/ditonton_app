// Mocks generated by Mockito 5.3.2 from annotations
// in tv_series/test/presentation/pages/popular_tvs_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i7;

import 'package:core/core.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_series/domain/entities/tv.dart' as _i5;
import 'package:tv_series/domain/usecases/get_popular_tvs.dart' as _i2;
import 'package:tv_series/presentation/provider/popular_tvs_notifier.dart'
    as _i3;

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

class _FakeGetPopularTVs_0 extends _i1.SmartFake implements _i2.GetPopularTVs {
  _FakeGetPopularTVs_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularTVsNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularTVsNotifier extends _i1.Mock
    implements _i3.PopularTVsNotifier {
  MockPopularTVsNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetPopularTVs get getPopularTVs => (super.noSuchMethod(
        Invocation.getter(#getPopularTVs),
        returnValue: _FakeGetPopularTVs_0(
          this,
          Invocation.getter(#getPopularTVs),
        ),
      ) as _i2.GetPopularTVs);
  @override
  _i4.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i4.RequestState.Empty,
      ) as _i4.RequestState);
  @override
  List<_i5.TV> get tvs => (super.noSuchMethod(
        Invocation.getter(#tvs),
        returnValue: <_i5.TV>[],
      ) as List<_i5.TV>);
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i6.Future<void> fetchPopularTVs() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularTVs,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
