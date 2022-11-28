import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:rxdart/rxdart.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class GetOnTheAirTVsBloc extends Bloc<TVEvent, TVState> {
  final GetOnTheAirTVs _getOnTheAirTV;
  GetOnTheAirTVsBloc(this._getOnTheAirTV) : super(LoadingTV()) {
    on<OnOnTheAirTVs>((event, emit) async {
      emit(LoadingTV());
      final result = await _getOnTheAirTV.execute();

      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetPopularTVsBloc extends Bloc<TVEvent, TVState> {
  final GetPopularTVs _getPopularTVs;

  GetPopularTVsBloc(this._getPopularTVs) : super(LoadingTV()) {
    on<OnPopularTVs>((event, emit) async {
      emit(LoadingTV());
      final result = await _getPopularTVs.execute();

      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetTopRatedTVsBloc extends Bloc<TVEvent, TVState> {
  final GetTopRatedTVs _getTopRatedTVs;

  GetTopRatedTVsBloc(this._getTopRatedTVs) : super(LoadingTV()) {
    on<OnTopRatedTVs>((event, emit) async {
      emit(LoadingTV());
      final result = await _getTopRatedTVs.execute();

      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetTVDetailBloc extends Bloc<TVEvent, TVState> {
  final GetTVDetail _getTVDetail;

  GetTVDetailBloc(this._getTVDetail) : super(LoadingTV()) {
    on<OnTVDetail>((event, emit) async {
      final id = event.id;

      emit(LoadingTV());
      final result = await _getTVDetail.execute(id);

      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(TVDetailHasData(data)),
      );
    });
  }
}

class GetTVRecommendationsBloc extends Bloc<TVEvent, TVState> {
  final GetTVRecommendations _getTVRecommendations;

  GetTVRecommendationsBloc(this._getTVRecommendations) : super(LoadingTV()) {
    on<OnTVRecommendations>((event, emit) async {
      final id = event.id;

      emit(LoadingTV());
      final result = await _getTVRecommendations.execute(id);

      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetWatchlistTVsBloc extends Bloc<TVEvent, TVState> {
  final GetWatchlistTVs _getWatchlistTVs;
  final GetWatchListStatusTV _getWatchListStatus;
  final SaveWatchlistTV _saveWatchlist;
  final RemoveWatchlistTV _removeWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  GetWatchlistTVsBloc(
    this._getWatchlistTVs,
    this._getWatchListStatus,
    this._saveWatchlist,
    this._removeWatchlist,
  ) : super(LoadingTV()) {
    on<OnWatchlistTVs>((event, emit) async {
      emit(LoadingTV());

      final result = await _getWatchlistTVs.execute();
      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
    on<OnWatchlistStatusTV>((event, emit) async {
      final id = event.id;
      emit(LoadingTV());

      final result = await _getWatchListStatus.execute(id);
      emit(WatchlistStatusTV(result));
    });
    on<OnSaveWatchlistTV>((event, emit) async {
      final tv = event.tvDetail;
      emit(LoadingTV());

      final result = await _saveWatchlist.execute(tv);
      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(WatchlistMessageTV(data)),
      );
    });
    on<OnRemoveWatchlistTV>((event, emit) async {
      final tv = event.tvDetail;
      emit(LoadingTV());

      final result = await _removeWatchlist.execute(tv);
      result.fold(
        (failure) => emit(ErrorTV(failure.message)),
        (data) => emit(WatchlistMessageTV(data)),
      );
    });
  }
}

class SearchTVsBloc extends Bloc<TVEvent, TVState> {
  final SearchTVs _searchTVs;

  SearchTVsBloc(this._searchTVs) : super(EmptyTV()) {
    on<OnSearchTVs>(
      (event, emit) async {
        final search = event.search;

        emit(LoadingTV());
        final result = await _searchTVs.execute(search);

        result.fold(
          (failure) {
            emit(ErrorTV(failure.message));
          },
          (data) {
            emit(SearchTVsHasData(data));
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