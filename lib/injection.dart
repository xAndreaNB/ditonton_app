import 'package:core/core.dart';
import 'package:core/utils/ssl_pinning.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/tv_series.dart';

final locator = GetIt.instance;

void init() {
  //bloc movies
  locator.registerFactory(() => SearchMoviesBloc(locator()));
  locator.registerFactory(() => GetNowPlayingMoviesBloc(locator()));
  locator.registerFactory(() => GetPopularMoviesBloc(locator()));
  locator.registerFactory(() => GetTopRatedMoviesBloc(locator()));
  locator.registerFactory(() => GetMovieDetailBloc(locator()));
  locator.registerFactory(() => GetMovieRecommendationsBloc(locator()));
  locator.registerFactory(() => GetWatchlistMoviesBloc(
        locator(),
        locator(),
        locator(),
        locator(),
      ));

  //bloc tv
  locator.registerFactory(() => SearchTVsBloc(locator()));
  locator.registerFactory(() => GetOnTheAirTVsBloc(locator()));
  locator.registerFactory(() => GetPopularTVsBloc(locator()));
  locator.registerFactory(() => GetTopRatedTVsBloc(locator()));
  locator.registerFactory(() => GetTVDetailBloc(locator()));
  locator.registerFactory(() => GetTVRecommendationsBloc(locator()));
  locator.registerFactory(() => GetWatchlistTVsBloc(
        locator(),
        locator(),
        locator(),
        locator(),
      ));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetOnTheAirTVs(locator()));
  locator.registerLazySingleton(() => GetPopularTVs(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVs(locator()));
  locator.registerLazySingleton(() => GetTVDetail(locator()));
  locator.registerLazySingleton(() => GetTVRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTVs(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTV(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTV(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTV(locator()));
  locator.registerLazySingleton(() => GetWatchlistTVs(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TVRemoteDataSource>(
      () => TVRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVLocalDataSource>(
      () => TVLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
