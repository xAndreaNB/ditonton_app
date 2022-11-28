import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/presentation/pages/popular_movies_page.dart';
import 'package:movies/presentation/widgets/movie_card_list.dart';

import '../../dummy_data/movies/dummy_objects_movies.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockGetPopularMoviesBloc mockGetPopularMoviesBloc;

  setUpAll(() {
    mockGetPopularMoviesBloc = MockGetPopularMoviesBloc();
    registerFallbackValue(MovieEventFake());
    registerFallbackValue(MovieStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPopularMoviesBloc>(create: (_) => mockGetPopularMoviesBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading', (WidgetTester tester) async {
    when(() => mockGetPopularMoviesBloc.state).thenReturn(LoadingMovie());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (WidgetTester tester) async {
    when(() => mockGetPopularMoviesBloc.state).thenReturn(MovieHasData(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display MovieCard when data is loaded', (WidgetTester tester) async {
    when(() => mockGetPopularMoviesBloc.state).thenReturn(MovieHasData(testMovieList));

    final movieCardFinder = find.byType(MovieCard);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(movieCardFinder, findsOneWidget);

    await tester.tap(find.byType(MovieCard));
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    when(() => mockGetPopularMoviesBloc.state).thenReturn(const ErrorMovie('error'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}