import 'package:core/core.dart';
import 'package:tv_series/data/models/tv_table.dart';

abstract class TVLocalDataSource {
  Future<String> insertWatchlistTV(TVTable tv);
  Future<String> removeWatchlistTV(TVTable tv);
  Future<TVTable?> getTVById(int id);
  Future<List<TVTable>> getWatchlistTVs();
}

class TVLocalDataSourceImpl implements TVLocalDataSource {
  final DatabaseHelper databaseHelper;

  TVLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistTV(TVTable tv) async {
    try {
      await databaseHelper.insertWatchlistTV(tv);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTV(TVTable tv) async {
    try {
      await databaseHelper.removeWatchlistTV(tv);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TVTable?> getTVById(int id) async {
    final result = await databaseHelper.getTVById(id);
    if (result != null) {
      return TVTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TVTable>> getWatchlistTVs() async {
    final result = await databaseHelper.getWatchlistTVs();
    return result.map((data) => TVTable.fromMap(data)).toList();
  }
}
