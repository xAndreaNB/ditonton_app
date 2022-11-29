import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';
import '../../../../tv_series/test/dummy_data/tv_series/dummy_objects_tvs.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockGetTVDetailBloc mockGetTVDetailBloc;
  late MockGetTVRecommendationsBloc mockGetTVRecommendationsBloc;
  late MockGetWatchlistTVsBloc mockGetWatchlistTVsBloc;

  setUpAll(() {
    mockGetTVDetailBloc = MockGetTVDetailBloc();
    mockGetTVRecommendationsBloc = MockGetTVRecommendationsBloc();
    mockGetWatchlistTVsBloc = MockGetWatchlistTVsBloc();
    registerFallbackValue(TVEventFake());
    registerFallbackValue(TVStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTVDetailBloc>(create: (_) => mockGetTVDetailBloc),
        BlocProvider<GetTVRecommendationsBloc>(create: (_) => mockGetTVRecommendationsBloc),
        BlocProvider<GetWatchlistTVsBloc>(create: (_) => mockGetWatchlistTVsBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Watchlist button should display an add icon when TV not added to watchlist', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVHasData(testTVList));
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist button should display a check icon when TV is added to watchlist', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(EmptyTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(true));
    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist button should display a Snackbar when added to watchlist', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(EmptyTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(GetWatchlistTVsBloc.watchlistAddSuccessMessage), findsOneWidget);
  });

  testWidgets('Watchlist button should display a Snackbar when removed from watchlist', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(EmptyTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(true));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(GetWatchlistTVsBloc.watchlistRemoveSuccessMessage), findsOneWidget);
  });

  testWidgets('Watchlist button should display a AlertDialog when add to watchlist failed', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(EmptyTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const ErrorTV('Failed'));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('Loading progress bar', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(LoadingTV());
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(LoadingTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(circularProgressIndicator, findsOneWidget);
  });

  testWidgets('Recommendation TV loading progress bar', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(LoadingTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(circularProgressIndicator, findsWidgets);
  });

  testWidgets('Recomendation TV error', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(const ErrorTV('Recommendation Error'));
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.text('Recommendation Error'), findsOneWidget);
  });

  testWidgets('Should be navigate to TVDetailPage when Image tap', (tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const TVDetailHasData(testTVDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVHasData(testTVList));
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));
    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));
    final typeCachedNetworkImage = find.byType(CachedNetworkImage);

    expect(typeCachedNetworkImage, findsAtLeastNWidgets(1));

    await tester.tap(typeCachedNetworkImage.first);
  });

  testWidgets('Should be text error when be error load', (tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(const ErrorTV('Failed'));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(EmptyTV());
    when(() => mockGetWatchlistTVsBloc.state).thenReturn(const WatchlistStatusTV(false));

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.text('Failed'), findsOneWidget);
  });
}
