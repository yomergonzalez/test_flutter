import 'package:animation/services/models/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoggedInAuthState extends AuthState {
  final User user;
  LoggedInAuthState(this.user);
}

class LoggedOutAuthState extends AuthState {}
