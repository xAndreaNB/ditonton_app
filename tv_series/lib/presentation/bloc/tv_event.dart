part of 'tv_bloc.dart';

abstract class TVEvent extends Equatable {
  const TVEvent();

  @override
  List<Object> get props => [];
}

class OnOnTheAirTVs extends TVEvent {}

class OnPopularTVs extends TVEvent {}

class OnTopRatedTVs extends TVEvent {}

class OnTVDetail extends TVEvent {
  final int id;
  const OnTVDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnTVRecommendations extends TVEvent {
  final int id;
  const OnTVRecommendations(this.id);

  @override
  List<Object> get props => [id];
}

class OnWatchlistTVs extends TVEvent {}

class OnWatchlistStatusTV extends TVEvent {
  final int id;
  const OnWatchlistStatusTV(this.id);

  @override
  List<Object> get props => [id];
}

class OnSaveWatchlistTV extends TVEvent {
  final TVDetail tvDetail;
  const OnSaveWatchlistTV(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class OnRemoveWatchlistTV extends TVEvent {
  final TVDetail tvDetail;
  const OnRemoveWatchlistTV(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class OnSearchTVs extends TVEvent {
  final String search;

  const OnSearchTVs({required this.search});

  @override
  List<Object> get props => [search];
}