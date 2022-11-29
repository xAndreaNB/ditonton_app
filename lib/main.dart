import 'package:about/about_page.dart';
import 'package:core/core.dart';
import 'package:core/utils/ssl_pinning.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAnalytics.instance.logAppOpen();
  await HttpSSLPinning.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // movies
        BlocProvider(create: (_) => di.locator<SearchMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetNowPlayingMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetPopularMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetTopRatedMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetMovieDetailBloc>()),
        BlocProvider(create: (_) => di.locator<GetMovieRecommendationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetWatchlistMoviesBloc>()),

        // tv series
        BlocProvider(create: (_) => di.locator<SearchTVsBloc>()),
        BlocProvider(create: (_) => di.locator<GetOnTheAirTVsBloc>()),
        BlocProvider(create: (_) => di.locator<GetPopularTVsBloc>()),
        BlocProvider(create: (_) => di.locator<GetTopRatedTVsBloc>()),
        BlocProvider(create: (_) => di.locator<GetTVDetailBloc>()),
        BlocProvider(create: (_) => di.locator<GetTVRecommendationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetWatchlistTVsBloc>()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            //Movies
            case HOME_MOVIE_ROUTE:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case POPULAR_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TOP_RATED_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case DETAIL_MOVIE_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SEARCH_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchMoviesPage());
            case WATCHLIST_MOVIE_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());

            //TV Series
            case HOME_TV_ROUTE:
              return MaterialPageRoute(builder: (_) => HomeTVPage());
            case ON_THE_AIR_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => OnTheAirTVsPage());
            case POPULAR_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularTVsPage());
            case TOP_RATED_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedTVsPage());
            case DETAIL_TV_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVDetailPage(id: id),
                settings: settings,
              );
            case SEARCH_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchTVsPage());
            case WATCHLIST_TV_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistTVsPage());

            // Ini tidak bagian dari movie & tv series
            case ABOUT_ROUTE:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
