part of 'tv_bloc.dart';

abstract class TVState extends Equatable {
  const TVState();

  @override
  List<Object> get props => [];
}

class EmptyTV extends TVState {}

class LoadingTV extends TVState {}

class ErrorTV extends TVState {
  final String message;

  const ErrorTV(this.message);

  @override
  List<Object> get props => [message];
}

class TVHasData extends TVState {
  final List<TV> result;

  const TVHasData(this.result);

  @override
  List<Object> get props => [result];
}

class TVDetailHasData extends TVState {
  final TVDetail result;

  const TVDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

class WatchlistMessageTV extends TVState {
  final String message;
  const WatchlistMessageTV(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistStatusTV extends TVState {
  final bool status;
  const WatchlistStatusTV(this.status);

  @override
  List<Object> get props => [status];
}

class SearchTVsHasData extends TVState {
  final List<TV> result;

  const SearchTVsHasData(this.result);

  @override
  List<Object> get props => [result];
}