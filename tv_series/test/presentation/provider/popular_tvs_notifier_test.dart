import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_popular_tvs.dart';
import 'package:tv_series/presentation/provider/popular_tvs_notifier.dart';
import '../../../../tv_series/test/dummy_data/tv_series/dummy_objects_tvs.dart';
import 'popular_tvs_notifier_test.mocks.dart';

@GenerateMocks([GetPopularTVs])
void main() {
  late MockGetPopularTVs mockGetPopularTVs;
  late PopularTVsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularTVs = MockGetPopularTVs();
    notifier = PopularTVsNotifier(mockGetPopularTVs)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTVList = <TV>[testTV];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularTVs.execute()).thenAnswer((_) async => Right(tTVList));
    // act
    notifier.fetchPopularTVs();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change tvs data when data is gotten successfully', () async {
    // arrange
    when(mockGetPopularTVs.execute()).thenAnswer((_) async => Right(tTVList));
    // act
    await notifier.fetchPopularTVs();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvs, tTVList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularTVs.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchPopularTVs();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
