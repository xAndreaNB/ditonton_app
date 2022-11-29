import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:movies/presentation/widgets/movie_card_list.dart';

import '../../dummy_data/movies/dummy_objects_movies.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockGetTopRatedMoviesBloc mockGetTopRatedMoviesBloc;

  setUpAll(() {
    mockGetTopRatedMoviesBloc = MockGetTopRatedMoviesBloc();
    registerFallbackValue(MovieEventFake());
    registerFallbackValue(MovieStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTopRatedMoviesBloc>(create: (_) => mockGetTopRatedMoviesBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display a progress bar when loading', (WidgetTester tester) async {
    when(() => mockGetTopRatedMoviesBloc.state).thenReturn(LoadingMovie());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display a MovieList when data is loaded', (WidgetTester tester) async {
    when(() => mockGetTopRatedMoviesBloc.state).thenReturn(MovieHasData(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display MovieCard when data is loaded', (WidgetTester tester) async {
    when(() => mockGetTopRatedMoviesBloc.state).thenReturn(MovieHasData(testMovieList));

    final movieCardFinder = find.byType(MovieCard);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(movieCardFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    when(() => mockGetTopRatedMoviesBloc.state).thenReturn(const ErrorMovie('Failed'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}