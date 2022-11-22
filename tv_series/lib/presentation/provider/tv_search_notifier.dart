import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/search_tvs.dart';

class TVSearchNotifier extends ChangeNotifier {
  final SearchTVs searchTVs;

  TVSearchNotifier({required this.searchTVs});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TV> _searchResult = [];
  List<TV> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTVSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTVs.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
