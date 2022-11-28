import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';

class MovieStateFake extends Fake implements MovieState {}

class MovieEventFake extends Fake implements MovieEvent {}

class MockGetNowPlayingMoviesBloc extends MockBloc<MovieEvent, MovieState> implements GetNowPlayingMoviesBloc {}

class MockGetPopularMoviesBloc extends MockBloc<MovieEvent, MovieState> implements GetPopularMoviesBloc {}

class MockGetTopRatedMoviesBloc extends MockBloc<MovieEvent, MovieState> implements GetTopRatedMoviesBloc {}

class MockGetMovieDetailBloc extends MockBloc<MovieEvent, MovieState> implements GetMovieDetailBloc {}

class MockGetMovieRecommendationsBloc extends MockBloc<MovieEvent, MovieState> implements GetMovieRecommendationsBloc {}

class MockGetWatchlistMoviesBloc extends MockBloc<MovieEvent, MovieState> implements GetWatchlistMoviesBloc {}
