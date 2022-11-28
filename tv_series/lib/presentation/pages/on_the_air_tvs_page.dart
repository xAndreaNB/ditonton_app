import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class OnTheAirTVsPage extends StatefulWidget {
  @override
  State<OnTheAirTVsPage> createState() => _OnTheAirTVsPageState();
}

class _OnTheAirTVsPageState extends State<OnTheAirTVsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<GetOnTheAirTVsBloc>().add(OnOnTheAirTVs()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnTheAir TVs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetOnTheAirTVsBloc, TVState>(
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
