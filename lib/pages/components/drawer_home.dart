import 'package:animation/bloc/auth/auth_bloc.dart';
import 'package:animation/bloc/auth/auth_state.dart';
import 'package:animation/bloc/theme/bloc.dart';
import 'package:animation/bloc/theme/theme_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _logout() {
      Scaffold.of(context).openEndDrawer();
      context.bloc<AuthBloc>().logoutUser();
      BlocProvider.of<ThemeBloc>(context).resetTheme();
    }

    _changeTheme() {
      BlocProvider.of<ThemeBloc>(context).changeTheme();
    }

    _switchTheme() {
      var theme =
          BlocProvider.of<ThemeBloc>(context).state.theme == DarkTheme().theme
              ? "switch_night"
              : "switch_day";
      return FlareActor("assets/switch.flr", animation: theme);
    }

    return BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext cont, AuthState st) {},
        builder: (context, state) {
          if (state is LoggedInAuthState) {
            return Drawer(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        state.user.username,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      title: MaterialButton(
                        onPressed: _logout,
                        child: Text('Cerrar Sesion'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 100,
                      child: MaterialButton(
                        onPressed: _changeTheme,
                        child: _switchTheme(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Drawer();
        });
  }
}
