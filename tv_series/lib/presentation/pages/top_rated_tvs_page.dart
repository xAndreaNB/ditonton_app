import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class TopRatedTVsPage extends StatefulWidget {
  @override
  State<TopRatedTVsPage> createState() => _TopRatedTVsPageState();
}

class _TopRatedTVsPageState extends State<TopRatedTVsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<GetTopRatedTVsBloc>().add(OnTopRatedTVs()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated TVs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetTopRatedTVsBloc, TVState>(
          builder: (context, state) {
            if (state is LoadingTV) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TVHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TVCard(tv);
                },
                itemCount: state.result.length,
              );
            } else {
              return const Center(
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}
