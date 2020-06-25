import 'package:animation/bloc/auth/auth_bloc.dart';
import 'package:animation/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme/theme_bloc.dart';
import 'bloc/theme/theme_state.dart';

void main() => runApp(multiBlocProvider());

MultiBlocProvider multiBlocProvider() {
  return MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(),
    ),
    BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
    ),
  ], child: MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
          title: 'TEST ',
          theme: ThemeData(brightness: state.theme),
          home: Splash()
      );
    });
  }
}
