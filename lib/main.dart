import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17_fri/core/observer.dart';
import 'package:news_c17_fri/core/theming/bloc/cubit.dart';
import 'package:news_c17_fri/core/theming/bloc/states.dart';
import 'package:news_c17_fri/di.dart';
import 'package:news_c17_fri/screens/home.dart';

import 'core/internet_checker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  InternetConnectivity().initialize();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
