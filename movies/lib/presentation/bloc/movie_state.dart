part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class EmptyMovie extends MovieState {}

class LoadingMovie extends MovieState {}

class ErrorMovie extends MovieState {
  final String message;

  const ErrorMovie(this.message);

  @override
  List<Object> get props => [message];
}

class MovieHasData extends MovieState {
  final List<Movie> result;

  const MovieHasData(this.result);

  @override
  List<Object> get props => [result];
}

class MovieDetailHasData extends MovieState {
  final MovieDetail result;

  const MovieDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

class WatchlistMessageMovie extends MovieState {
  final String message;
  const WatchlistMessageMovie(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistStatusMovie extends MovieState {
  final bool status;
  const WatchlistStatusMovie(this.status);

  @override
  List<Object> get props => [status];
}

class SearchMoviesHasData extends MovieState {
  final List<Movie> result;

  const SearchMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}