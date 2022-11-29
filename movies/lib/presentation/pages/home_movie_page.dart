import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GetNowPlayingMoviesBloc>().add(OnNowPlayingMovies());
      context.read<GetPopularMoviesBloc>().add(OnPopularMovies());
      context.read<GetTopRatedMoviesBloc>().add(OnTopRatedMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                FirebaseAnalytics.instance.logScreenView(screenName: 'Home Movie Page');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Movie'),
              onTap: () {
                FirebaseAnalytics.instance.logScreenView(screenName: 'Watchlist Movie Page');
                Navigator.pushNamed(context, WATCHLIST_MOVIE_ROUTE);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('TV Series'),
              onTap: () {
                FirebaseAnalytics.instance.logScreenView(screenName: 'TV Series Page');
                Navigator.pushNamed(context, HOME_TV_ROUTE);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist TV Series'),
              onTap: () {
                FirebaseAnalytics.instance.logScreenView(screenName: 'Watchlist TV Series Page');
                Navigator.pushNamed(context, WATCHLIST_TV_ROUTE);
              },
            ),
            ListTile(
              onTap: () {
                FirebaseAnalytics.instance.logScreenView(screenName: 'About Page');
                Navigator.pushNamed(context, ABOUT_ROUTE);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
            ListTile(
              onTap: () {
                FirebaseCrashlytics.instance.crash();
              },
              leading: const Icon(Icons.error),
              title: const Text('Crash Test'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton Movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SEARCH_MOVIE_ROUTE);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              BlocBuilder<GetNowPlayingMoviesBloc, MovieState>(builder: (context, state) {
                if (state is LoadingMovie) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieHasData) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, POPULAR_MOVIE_ROUTE),
              ),
              BlocBuilder<GetPopularMoviesBloc, MovieState>(builder: (context, state) {
                if (state is LoadingMovie) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieHasData) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TOP_RATED_MOVIE_ROUTE),
              ),
              BlocBuilder<GetTopRatedMoviesBloc, MovieState>(builder: (context, state) {
                if (state is LoadingMovie) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieHasData) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DETAIL_MOVIE_ROUTE,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
