import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/pages/popular_tvs_page.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

import '../../dummy_data/tv_series/dummy_objects_tvs.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockGetPopularTVsBloc mockGetPopularTVsBloc;

  setUpAll(() {
    mockGetPopularTVsBloc = MockGetPopularTVsBloc();
    registerFallbackValue(TVEventFake());
    registerFallbackValue(TVStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPopularTVsBloc>(create: (_) => mockGetPopularTVsBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display a center progress bar when loading', (WidgetTester tester) async {
    when(() => mockGetPopularTVsBloc.state).thenReturn(LoadingTV());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(PopularTVsPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display a TVList when data is loaded', (WidgetTester tester) async {
    when(() => mockGetPopularTVsBloc.state).thenReturn(TVHasData(testTVList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(PopularTVsPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display a TVCard when data is loaded', (WidgetTester tester) async {
    when(() => mockGetPopularTVsBloc.state).thenReturn(TVHasData(testTVList));

    final tvCardFinder = find.byType(TVCard);

    await tester.pumpWidget(_makeTestableWidget(PopularTVsPage()));

    expect(tvCardFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    when(() => mockGetPopularTVsBloc.state).thenReturn(const ErrorTV('Failed'));

    final textFinder = find.text('Failed');

    await tester.pumpWidget(_makeTestableWidget(PopularTVsPage()));

    expect(textFinder, findsOneWidget);
  });
}