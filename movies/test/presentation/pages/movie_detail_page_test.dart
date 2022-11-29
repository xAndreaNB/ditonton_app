import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/presentation/pages/movie_detail_page.dart';

import '../../dummy_data/movies/dummy_objects_movies.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockGetMovieDetailBloc mockGetMovieDetailBloc;
  late MockGetMovieRecommendationsBloc mockGetMovieRecommendationsBloc;
  late MockGetWatchlistMoviesBloc mockGetWatchlistMoviesBloc;

  setUpAll(() {
    mockGetMovieDetailBloc = MockGetMovieDetailBloc();
    mockGetMovieRecommendationsBloc = MockGetMovieRecommendationsBloc();
    mockGetWatchlistMoviesBloc = MockGetWatchlistMoviesBloc();
    registerFallbackValue(MovieEventFake());
    registerFallbackValue(MovieStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetMovieDetailBloc>(create: (_) => mockGetMovieDetailBloc),
        BlocProvider<GetMovieRecommendationsBloc>(create: (_) => mockGetMovieRecommendationsBloc),
        BlocProvider<GetWatchlistMoviesBloc>(create: (_) => mockGetWatchlistMoviesBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Watchlist button should display an add icon when a movie is not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(MovieHasData(testMovieList));
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist button should display a check icon when movie is added to watchlist',
      (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(EmptyMovie());
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(true));
    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist button should display a Snackbar when added to watchlist', (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(EmptyMovie());
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(GetWatchlistMoviesBloc.watchlistAddSuccessMessage), findsOneWidget);
  });

  testWidgets('Watchlist button should display a Snackbar when removed from watchlist', (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(EmptyMovie());
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(true));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(GetWatchlistMoviesBloc.watchlistRemoveSuccessMessage), findsOneWidget);
  });

  testWidgets('Watchlist button should display an AlertDialog when add to failed watchlist', (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(EmptyMovie());
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const ErrorMovie('Failed'));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('Loading progress bar', (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(LoadingMovie());
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(LoadingMovie());
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(false));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(circularProgressIndicator, findsOneWidget);
  });

  testWidgets('Recomendation movies loading progress bar', (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(LoadingMovie());
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(false));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(circularProgressIndicator, findsWidgets);
  });

  testWidgets('Recommendation movies error', (WidgetTester tester) async {
    when(() => mockGetMovieDetailBloc.state).thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockGetMovieRecommendationsBloc.state).thenReturn(const ErrorMovie('recommendation error'));
    when(() => mockGetWatchlistMoviesBloc.state).thenReturn(const WatchlistStatusMovie(false));

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.text('recommendation error'), findsOneWidget);
  });
}