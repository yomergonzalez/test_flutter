import 'package:animation/bloc/auth/auth_bloc.dart';
import 'package:animation/bloc/auth/auth_state.dart';
import 'package:animation/bloc/pagination/bloc.dart';
import 'package:animation/pages/home/components/paginate_gallery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child:  BlocProvider(
        create: (BuildContext context) => PaginationBloc(),
        child: Stack(
          children: <Widget>[
            Header(),
            body(context),
          ],
        ),
      ),
    );
  }


  body(context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(30))),
      margin: EdgeInsets.only(top: 150),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: PaginateGallery(),
    );
  }
}