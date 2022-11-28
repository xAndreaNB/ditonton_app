
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status_movie.dart';
import 'package:movies/domain/usecases/remove_watchlist_movie.dart';
import 'package:movies/domain/usecases/save_watchlist_movie.dart';
import 'package:movies/domain/usecases/search_movies.dart';
import 'package:rxdart/rxdart.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class GetNowPlayingMoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  GetNowPlayingMoviesBloc(this._getNowPlayingMovies) : super(LoadingMovie()) {
    on<OnNowPlayingMovies>((event, emit) async {
      emit(LoadingMovie());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(MovieHasData(data)),
      );
    });
  }
}

class GetPopularMoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMovies _getPopularMovies;

  GetPopularMoviesBloc(this._getPopularMovies) : super(LoadingMovie()) {
    on<OnPopularMovies>((event, emit) async {
      emit(LoadingMovie());
      final result = await _getPopularMovies.execute();

      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(MovieHasData(data)),
      );
    });
  }
}

class GetTopRatedMoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetTopRatedMovies _getTopRatedMovies;

  GetTopRatedMoviesBloc(this._getTopRatedMovies) : super(LoadingMovie()) {
    on<OnTopRatedMovies>((event, emit) async {
      emit(LoadingMovie());
      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(MovieHasData(data)),
      );
    });
  }
}

class GetMovieDetailBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieDetail _getMovieDetail;

  GetMovieDetailBloc(this._getMovieDetail) : super(LoadingMovie()) {
    on<OnMovieDetail>((event, emit) async {
      final id = event.id;

      emit(LoadingMovie());
      final result = await _getMovieDetail.execute(id);

      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(MovieDetailHasData(data)),
      );
    });
  }
}

class GetMovieRecommendationsBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieRecommendations _getMovieRecommendations;

  GetMovieRecommendationsBloc(this._getMovieRecommendations) : super(LoadingMovie()) {
    on<OnMovieRecommendations>((event, emit) async {
      final id = event.id;

      emit(LoadingMovie());
      final result = await _getMovieRecommendations.execute(id);

      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(MovieHasData(data)),
      );
    });
  }
}

class GetWatchlistMoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatusMovie _getWatchListStatusMovie;
  final SaveWatchlistMovie _saveWatchlistMovie;
  final RemoveWatchlistMovie _removeWatchlistMovie;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  GetWatchlistMoviesBloc(
    this._getWatchlistMovies,
    this._getWatchListStatusMovie,
    this._saveWatchlistMovie,
    this._removeWatchlistMovie,
  ) : super(LoadingMovie()) {
    on<OnWatchlistMovies>((event, emit) async {
      emit(LoadingMovie());

      final result = await _getWatchlistMovies.execute();
      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(MovieHasData(data)),
      );
    });
    on<OnWatchlistStatusMovie>((event, emit) async {
      final id = event.id;
      emit(LoadingMovie());

      final result = await _getWatchListStatusMovie.execute(id);
      emit(WatchlistStatusMovie(result));
    });
    on<OnSaveWatchlistMovie>((event, emit) async {
      final movie = event.movieDetail;
      emit(LoadingMovie());

      final result = await _saveWatchlistMovie.execute(movie);
      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(WatchlistMessageMovie(data)),
      );
    });
    on<OnRemoveWatchlistMovie>((event, emit) async {
      final movie = event.movieDetail;
      emit(LoadingMovie());

      final result = await _removeWatchlistMovie.execute(movie);
      result.fold(
        (failure) => emit(ErrorMovie(failure.message)),
        (data) => emit(WatchlistMessageMovie(data)),
      );
    });
  }
}

class SearchMoviesBloc extends Bloc<MovieEvent, MovieState> {
  final SearchMovies _searchMovies;

  SearchMoviesBloc(this._searchMovies) : super(EmptyMovie()) {
    on<OnSearchMovies>(
      (event, emit) async {
        final search = event.search;

        emit(LoadingMovie());
        final result = await _searchMovies.execute(search);

        result.fold(
          (failure) {
            emit(ErrorMovie(failure.message));
          },
          (data) {
            emit(SearchMoviesHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
