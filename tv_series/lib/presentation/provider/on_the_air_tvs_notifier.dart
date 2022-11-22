import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tvs.dart';

class OnTheAirTVsNotifier extends ChangeNotifier {
  final GetOnTheAirTVs getOnTheAirTVs;

  OnTheAirTVsNotifier(this.getOnTheAirTVs);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TV> _tvs = [];
  List<TV> get tvs => _tvs;

  String _message = '';
  String get message => _message;

  Future<void> fetchOnTheAirTVs() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getOnTheAirTVs.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvsData) {
        _tvs = tvsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
