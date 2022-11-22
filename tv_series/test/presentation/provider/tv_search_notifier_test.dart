import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/search_tvs.dart';
import 'package:tv_series/presentation/provider/tv_search_notifier.dart';
import '../../../../tv_series/test/dummy_data/tv_series/dummy_objects_tvs.dart';
import 'tv_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTVs])
void main() {
  late TVSearchNotifier provider;
  late MockSearchTVs mockSearchTVs;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchTVs = MockSearchTVs();
    provider = TVSearchNotifier(searchTVs: mockSearchTVs)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTVList = <TV>[testTV];
  final tQuery = 'fairy tail';

  group('search tvs', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTVs.execute(tQuery))
          .thenAnswer((_) async => Right(tTVList));
      // act
      provider.fetchTVSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchTVs.execute(tQuery))
          .thenAnswer((_) async => Right(tTVList));
      // act
      await provider.fetchTVSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tTVList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTVs.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTVSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
