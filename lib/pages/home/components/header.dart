import 'package:animation/bloc/auth/auth_bloc.dart';
import 'package:animation/bloc/auth/auth_state.dart';
import 'package:animation/bloc/pagination/pagination_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: AlignmentDirectional(
              0,3
            ),
            colors: [Colors.blueGrey, Colors.indigo],
            stops: [0.4,0.8]
        ),
      ),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buttonDrawer(context),
          title(),
          buttonReset(context)
        ],
      ),
    );
  }

  GestureDetector buttonReset(BuildContext context) {
    return GestureDetector(
        onTap: () => BlocProvider.of<PaginationBloc>(context).resetPhotos(),
        child: Icon(Icons.refresh, size: 25, color: Colors.white));
  }

  GestureDetector buttonDrawer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Icon(
        Icons.menu,
        size: 25,
        color: Colors.white,
      ),
    );
  }

  Flexible title() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext cont, AuthState st) {},
            builder: (context, state) {
              if (state is LoggedInAuthState) {
                return Text('Saludos ' + state.user.username,
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold));
              }
              return null;
            }),
      ),
    );
  }
}
