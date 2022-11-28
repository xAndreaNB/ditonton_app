import 'package:core/core.dart';
import 'package:movies/data/models/movie_detail_model.dart';
import 'package:movies/data/models/movie_model.dart';
import 'package:movies/data/models/movie_table.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';

const testMovieModel = MovieModel(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

const testMovieDetailResponse = MovieDetailResponse(
  adult: false,
  backdropPath: 'backdropPath',
  budget: 10,
  genres: [],
  homepage: 'homepage',
  id: 1,
  imdbId: 'imdbId',
  originalLanguage: 'originalLanguage',
  originalTitle: 'originalTitle',
  overview: 'overview',
  popularity: 1.0,
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  revenue: 10,
  runtime: 10,
  status: 'status',
  tagline: 'tagline',
  title: 'title',
  video: false,
  voteAverage: 1.0,
  voteCount: 1,
);

final testMovieDetailResponseJson = {
  "adult": false,
  "backdrop_path": 'backdropPath',
  "budget": 10,
  "genres": [],
  "homepage": 'homepage',
  "id": 1,
  "imdb_id": 'imdbId',
  "original_language": 'originalLanguage',
  "original_title": 'originalTitle',
  "overview": 'overview',
  "popularity": 1.0,
  "poster_path": 'posterPath',
  "release_date": 'releaseDate',
  "revenue": 10,
  "runtime": 10,
  "status": 'status',
  "tagline": 'tagline',
  "title": 'title',
  "video": false,
  "vote_average": 1.0,
  "vote_count": 1,
};
