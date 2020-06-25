import 'package:animation/bloc/request/bloc.dart';
import 'package:animation/pages/login/components/login_form.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FlareActor("assets/bg.flr", fit: BoxFit.cover, animation: "Background Loop"),
        ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100,bottom: 30),
              child: Text("Inicio de Sesion", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
            ),
            BlocProvider(
                create: (BuildContext context) => RequestBloc(),
                child: LoginForm()
            )
          ],
        ),
      ],
    );
  }
}
