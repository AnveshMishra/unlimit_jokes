import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unlimit_jokes_app/presentation/pages/jokes_listing/bloc/jokes_bloc.dart';

import 'core/di/injection.dart';
import 'core/utils/shared_pref/shared_pref_utils.dart';
import 'presentation/pages/jokes_listing/jokes_listing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initDependencies(),
    SharedPreferencesUtils().init(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => sl<JokesBloc>(),
          child: const JokesListingScreen(),
        ));
  }
}
