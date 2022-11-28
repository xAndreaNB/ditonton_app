import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';

class TVStateFake extends Fake implements TVState {}

class TVEventFake extends Fake implements TVEvent {}

class MockGetOnTheAirTVsBloc extends MockBloc<TVEvent, TVState> implements GetOnTheAirTVsBloc {}

class MockGetPopularTVsBloc extends MockBloc<TVEvent, TVState> implements GetPopularTVsBloc {}

class MockGetTopRatedTVsBloc extends MockBloc<TVEvent, TVState> implements GetTopRatedTVsBloc {}

class MockGetTVDetailBloc extends MockBloc<TVEvent, TVState> implements GetTVDetailBloc {}

class MockGetTVRecommendationsBloc extends MockBloc<TVEvent, TVState> implements GetTVRecommendationsBloc {}

class MockGetWatchlistTVsBloc extends MockBloc<TVEvent, TVState> implements GetWatchlistTVsBloc {}
