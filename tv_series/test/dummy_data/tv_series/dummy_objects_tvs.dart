
import 'package:core/core.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import 'package:tv_series/data/models/tv_model.dart';
import 'package:tv_series/data/models/tv_response_model.dart';
import 'package:tv_series/data/models/tv_table.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

final testTVModel = TVModel(
  backdropPath: '/path.jpg',
  genreIds: const [1, 2, 3, 4],
  id: 1,
  originalName: 'Original Name',
  overview: "Overview",
  popularity: 1.0,
  posterPath: '/path.jpg',
  firstAirDate: '2020-05-05',
  name: 'Name',
  voteAverage: 1.0,
  voteCount: 1,
);

final testTV = TV(
  backdropPath: '/path.jpg',
  genreIds: const [1, 2, 3, 4],
  id: 1,
  originalName: 'Original Name',
  overview: "Overview",
  popularity: 1.0,
  posterPath: '/path.jpg',
  firstAirDate: '2020-05-05',
  name: 'Name',
  voteAverage: 1.0,
  voteCount: 1,
);

final testTVList = [testTV];

final testTVDetail = TVDetail(
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: 'firstAirDate',
  name: 'name',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistTV = TV.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testTVTable = TVTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTVMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};

final testTVResponseModel = TVResponseModel(tvList: <TVModel>[testTVModel]);

const testTVDetailResponse = TVDetailResponse(
  backdropPath: 'backdropPath',
  genres: [],
  homepage: 'homepage',
  id: 1,
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 1.0,
  posterPath: 'posterPath',
  firstAirDate: 'firstAirDate',
  status: 'status',
  tagline: 'tagline',
  name: 'name',
  voteAverage: 1.0,
  voteCount: 1,
);

final testTVDetailResponseJson = {
  "backdrop_path": 'backdropPath',
  "genres": [],
  "homepage": 'homepage',
  "id": 1,
  "original_language": 'originalLanguage',
  "original_name": 'originalName',
  "overview": 'overview',
  "popularity": 1.0,
  "poster_path": 'posterPath',
  "first_air_date": 'firstAirDate',
  "status": 'status',
  "tagline": 'tagline',
  "name": 'name',
  "vote_average": 1.0,
  "vote_count": 1,
};
