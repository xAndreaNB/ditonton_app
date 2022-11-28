import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class PopularTVsPage extends StatefulWidget {
  @override
 State<PopularTVsPage> createState() => _PopularTVsPageState();
}

class _PopularTVsPageState extends State<PopularTVsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<GetPopularTVsBloc>().add(OnPopularTVs()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TVs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetPopularTVsBloc, TVState>(
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
