import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tvs.dart';
import 'package:tv_series/domain/usecases/get_popular_tvs.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tvs.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';
import 'package:tv_series/domain/usecases/get_watchlist_status_tv.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tvs.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';

import '../../dummy_data/tv_series/dummy_objects_tvs.dart';
import 'tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetOnTheAirTVs,
  GetPopularTVs,
  GetTopRatedTVs,
  GetTVDetail,
  GetTVRecommendations,
  GetWatchlistTVs,
  GetWatchListStatusTV,
  SaveWatchlistTV,
  RemoveWatchlistTV,
])
void main() {
  late GetOnTheAirTVsBloc getOnTheAirTVsBloc;
  late GetPopularTVsBloc getPopularTVsBloc;
  late GetTopRatedTVsBloc getTopRatedTVsBloc;
  late GetTVDetailBloc getTVDetailBloc;
  late GetTVRecommendationsBloc getTVRecommendationsBloc;
  late GetWatchlistTVsBloc getWatchlistTVsBloc;

  late MockGetOnTheAirTVs mockGetOnTheAirTVs;
  late MockGetPopularTVs mockGetPopularTVs;
  late MockGetTopRatedTVs mockGetTopRatedTVs;
  late MockGetTVDetail mockGetTVDetail;
  late MockGetTVRecommendations mockGetTVRecommendations;
  late MockGetWatchlistTVs mockGetWatchlistTVs;
  late MockGetWatchListStatusTV mockGetWatchListTVStatus;
  late MockSaveWatchlistTV mockSaveWatchlistTV;
  late MockRemoveWatchlistTV mockRemoveWatchlistTV;

  setUp(() {
    mockGetOnTheAirTVs = MockGetOnTheAirTVs();
    mockGetPopularTVs = MockGetPopularTVs();
    mockGetTopRatedTVs = MockGetTopRatedTVs();
    mockGetTVDetail = MockGetTVDetail();
    mockGetTVRecommendations = MockGetTVRecommendations();
    mockGetWatchlistTVs = MockGetWatchlistTVs();
    mockGetWatchListTVStatus = MockGetWatchListStatusTV();
    mockSaveWatchlistTV = MockSaveWatchlistTV();
    mockRemoveWatchlistTV = MockRemoveWatchlistTV();

    getOnTheAirTVsBloc = GetOnTheAirTVsBloc(mockGetOnTheAirTVs);
    getPopularTVsBloc = GetPopularTVsBloc(mockGetPopularTVs);
    getTopRatedTVsBloc = GetTopRatedTVsBloc(mockGetTopRatedTVs);
    getTVDetailBloc = GetTVDetailBloc(mockGetTVDetail);
    getTVRecommendationsBloc = GetTVRecommendationsBloc(mockGetTVRecommendations);
    getWatchlistTVsBloc = GetWatchlistTVsBloc(
      mockGetWatchlistTVs,
      mockGetWatchListTVStatus,
      mockSaveWatchlistTV,
      mockRemoveWatchlistTV,
    );
  });

  const tId = 1;
  const tSaveMessage = GetWatchlistTVsBloc.watchlistAddSuccessMessage;
  const tRemoveMessage = GetWatchlistTVsBloc.watchlistRemoveSuccessMessage;

  group('on the air tvs', () {
    test('initial state should be loading', () {
      expect(getOnTheAirTVsBloc.state, LoadingTV());
    });

    blocTest<GetOnTheAirTVsBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetOnTheAirTVs.execute()).thenAnswer((_) async => Right(testTVList));
        return getOnTheAirTVsBloc;
      },
      act: (bloc) => bloc.add(OnOnTheAirTVs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        TVHasData(testTVList),
      ],
      verify: (bloc) {
        verify(mockGetOnTheAirTVs.execute());
      },
    );

    blocTest<GetOnTheAirTVsBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetOnTheAirTVs.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return getOnTheAirTVsBloc;
      },
      act: (bloc) => bloc.add(OnOnTheAirTVs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        const ErrorTV('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetOnTheAirTVs.execute());
      },
    );
  });

  group('popular tvs', () {
    test('initial state should be loading', () {
      expect(getPopularTVsBloc.state, LoadingTV());
    });

    blocTest<GetPopularTVsBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTVs.execute()).thenAnswer((_) async => Right(testTVList));
        return getPopularTVsBloc;
      },
      act: (bloc) => bloc.add(OnPopularTVs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        TVHasData(testTVList),
      ],
      verify: (bloc) {
        verify(mockGetPopularTVs.execute());
      },
    );
    blocTest<GetPopularTVsBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetPopularTVs.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return getPopularTVsBloc;
      },
      act: (bloc) => bloc.add(OnPopularTVs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        const ErrorTV('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetPopularTVs.execute());
      },
    );
  });

  group('top rated tvs', () {
    test('initial state should be loading', () {
      expect(getTopRatedTVsBloc.state, LoadingTV());
    });

    blocTest<GetTopRatedTVsBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTVs.execute()).thenAnswer((_) async => Right(testTVList));
        return getTopRatedTVsBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTVs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        TVHasData(testTVList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTVs.execute());
      },
    );
    blocTest<GetTopRatedTVsBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetTopRatedTVs.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return getTopRatedTVsBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTVs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        const ErrorTV('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTVs.execute());
      },
    );
  });

  group('tv detail', () {
    test('initial state should be loading', () {
      expect(getTVDetailBloc.state, LoadingTV());
    });

    blocTest<GetTVDetailBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVDetail.execute(tId)).thenAnswer((_) async => const Right(testTVDetail));
        return getTVDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTVDetail(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        const TVDetailHasData(testTVDetail),
      ],
      verify: (bloc) {
        verify(mockGetTVDetail.execute(tId));
      },
    );
    blocTest<GetTVDetailBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetTVDetail.execute(tId)).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return getTVDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTVDetail(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        const ErrorTV('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTVDetail.execute(tId));
      },
    );
  });

  group('tv recommendations', () {
    test('initial state should be loading', () {
      expect(getTVRecommendationsBloc.state, LoadingTV());
    });

    blocTest<GetTVRecommendationsBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVRecommendations.execute(tId)).thenAnswer((_) async => Right(testTVList));
        return getTVRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const OnTVRecommendations(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        TVHasData(testTVList),
      ],
      verify: (bloc) {
        verify(mockGetTVRecommendations.execute(tId));
      },
    );
    blocTest<GetTVRecommendationsBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetTVRecommendations.execute(tId))
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return getTVRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const OnTVRecommendations(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        LoadingTV(),
        const ErrorTV('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTVRecommendations.execute(tId));
      },
    );
  });

  group('watchlist tvs', () {
    test('initial state should be loading', () {
      expect(getWatchlistTVsBloc.state, LoadingTV());
    });
    group('get watchlist tvs list', () {
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchlistTVs.execute()).thenAnswer((_) async => Right(testTVList));
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(OnWatchlistTVs()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          TVHasData(testTVList),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTVs.execute());
        },
      );
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, Error] when unsuccessful',
        build: () {
          when(mockGetWatchlistTVs.execute()).thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(OnWatchlistTVs()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          const ErrorTV('Database Failure'),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTVs.execute());
        },
      );
    });

    group('get watchlist tvs status', () {
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchListTVStatus.execute(tId)).thenAnswer((_) async => true);
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(const OnWatchlistStatusTV(tId)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          const WatchlistStatusTV(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchListTVStatus.execute(tId));
        },
      );
    });

    group('save watchlist tv', () {
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSaveWatchlistTV.execute(testTVDetail)).thenAnswer((_) async => const Right(tSaveMessage));
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(const OnSaveWatchlistTV(testTVDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          const WatchlistMessageTV(tSaveMessage),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistTV.execute(testTVDetail));
        },
      );
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, Error] when unsuccessful',
        build: () {
          when(mockSaveWatchlistTV.execute(testTVDetail))
              .thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(const OnSaveWatchlistTV(testTVDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          const ErrorTV('Database Failure'),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistTV.execute(testTVDetail));
        },
      );
    });
    group('remove watchlist tv', () {
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockRemoveWatchlistTV.execute(testTVDetail)).thenAnswer((_) async => const Right(tRemoveMessage));
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(const OnRemoveWatchlistTV(testTVDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          const WatchlistMessageTV(tRemoveMessage),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistTV.execute(testTVDetail));
        },
      );
      blocTest<GetWatchlistTVsBloc, TVState>(
        'Should emit [Loading, Error] when unsuccessful',
        build: () {
          when(mockRemoveWatchlistTV.execute(testTVDetail))
              .thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
          return getWatchlistTVsBloc;
        },
        act: (bloc) => bloc.add(const OnRemoveWatchlistTV(testTVDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          LoadingTV(),
          const ErrorTV('Database Failure'),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistTV.execute(testTVDetail));
        },
      );
    });
  });
}