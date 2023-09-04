import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unlimit_jokes_app/presentation/pages/jokes_listing/bloc/jokes_bloc.dart';
import 'package:unlimit_jokes_app/presentation/pages/jokes_listing/widgets/jokes_container.dart';

class JokesListingScreen extends StatefulWidget {
  const JokesListingScreen({super.key});

  @override
  State<JokesListingScreen> createState() => _JokesListingScreenState();
}

class _JokesListingScreenState extends State<JokesListingScreen> {
  late JokesBloc bloc;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    bloc = context.read<JokesBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(JokesInit());
      timer = Timer.periodic(const Duration(seconds: 60), (timer) {
        bloc.add(GetJokeFromApi());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unlimit Jokes'),
      ),
      body: BlocBuilder<JokesBloc, JokesState>(
        builder: (context, state) {
          if (state is ShowJokeList || state is RefreshList) {
            List data = bloc.jokesList;
            return ListView.builder(
              itemBuilder: (_, index) => JokeContainer(joke: data[index]),
              itemCount: data.length > 10 ? 10 : data.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
