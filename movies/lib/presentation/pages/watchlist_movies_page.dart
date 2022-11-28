import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/presentation/widgets/movie_card_list.dart';

class WatchlistMoviesPage extends StatefulWidget {
  @override
  State<WatchlistMoviesPage> createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<GetWatchlistMoviesBloc>().add(OnWatchlistMovies()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<GetWatchlistMoviesBloc>().add(OnWatchlistMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetWatchlistMoviesBloc, MovieState>(
          builder: (context, state) {
            if (state is LoadingMovie) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return MovieCard(movie);
                },
                itemCount: state.result.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text("Failed"),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
