import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb/bloc/home_states.dart';
import 'package:tmdb/core/router/router.dart';
import 'package:tmdb/core/theme/dark_mode.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkMode.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGeneretor.router.onGenerate,
      initialRoute: 'splash',
    );
  }
}
