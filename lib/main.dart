import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c17_fri/core/observer.dart';
import 'package:news_c17_fri/core/theming/bloc/cubit.dart';
import 'package:news_c17_fri/core/theming/bloc/states.dart';
import 'package:news_c17_fri/di.dart';
import 'package:news_c17_fri/models/source_response_adapter.dart';
import 'package:news_c17_fri/screens/home.dart';

import 'core/internet_checker.dart';
import 'models/news_data_response_adapter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  InternetConnectivity().initialize();
  Hive.initFlutter();
  Hive.registerAdapter(NewsDataResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourceResponseAdapter());
  Hive.registerAdapter(SourcesAdapter());

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
