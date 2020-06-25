import 'package:animation/bloc/auth/auth_bloc.dart';
import 'package:animation/bloc/request/request_bloc.dart';
import 'package:animation/bloc/request/request_state.dart';
import 'package:animation/functions.dart';
import 'package:animation/pages/components/dynamic_button.dart';
import 'package:animation/pages/login/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _data = new Map<String, String>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextLoginField(
              hint: 'Usuario',
              validator: (value) => (value.isEmpty) ? 'Ingrese Usuario' : null,
              onSaved: (string) => _data['username'] = string,
            ),
            TextLoginField(
              hint: 'Password',
              validator: (value) => (value.isEmpty) ? 'Ingrese Password' : null,
              onSaved: (string) => _data['password'] = string,
            ),
            submitButton(),
          ]
      ),
    );
  }

  /// BOTON INICIAR SESION
  BlocConsumer<RequestBloc, RequestState> submitButton() {
    return BlocConsumer<RequestBloc, RequestState>(
        listenWhen: (previous, current) => (previous.loading != current.loading),
        listener: (context, state) {
          if (state is SuccessRequestState) {
              context.bloc<AuthBloc>().loginUser(state.data);
          }
          if (state is ErrorRequestState) {
            Functions.showAlert(context, AlertType.ERROR, state.message);
          }

        },
        builder: (context, state) {
          return DynamicButton(
            loading: state.loading,
            title: 'Confirmar',
            onPress: () {
              if (_formKey.currentState.validate()) {
                Functions.showAlert(context, AlertType.INFO, 'Iniciando sesion..');
                _formKey.currentState.save();
                context.bloc<RequestBloc>().loginUser(_data['username'], _data['password']);
              }
            },
          );
        });
  }
}
