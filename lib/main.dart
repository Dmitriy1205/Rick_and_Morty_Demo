import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/home_cubit.dart';
import 'package:rick_and_morty/presentation/screens/home_screen.dart';

import 'core/config/service_locator.dart';

void main() async {
  await boot();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => sl<HomeCubit>(),
        child: HomeScreen(),
      ),
    );
  }
}
