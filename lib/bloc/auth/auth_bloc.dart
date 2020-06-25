import 'dart:async';
import 'package:animation/services/auth_service.dart';
import 'package:animation/services/models/user.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => InitialAuthState();
  AuthService _authService = AuthService();

  void verifyLogin() async {
    User user = await _authService.checkSession();
    if (user != null) {
      add(LoggedInEvent(user: user));
    } else {
      add(LoggedOutEvent());
    }
  }

  Future<void> loginUser(User user) async {
    await _authService.saveUserSession(user);
    add(LoggedInEvent(user: user));
  }

  Future<void> logoutUser() async {
    await _authService.logoutUser();
    add(LoggedOutEvent());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoggedInEvent) {
      yield LoggedInAuthState(event.user);
    }
    if (event is LoggedOutEvent) {
      yield LoggedOutAuthState();
    }
  }
}
