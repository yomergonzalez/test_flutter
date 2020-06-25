import 'package:animation/pages/components/drawer_home.dart';
import 'package:animation/pages/home/home.dart';
import 'package:animation/pages/login/login.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/auth/auth_state.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).verifyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerHome(),
        body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoggedInAuthState) {
                return Home();
              }
              if (state is LoggedOutAuthState) {
                return Login();
              }
              return Container(
                child: FlareActor("assets/city.flr", animation: "nubes"),
              );
            }) //,
        );
  }
}
