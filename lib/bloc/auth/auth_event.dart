import 'package:animation/services/models/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent {}

class LoggedInEvent extends AuthEvent{
  final User user;
  LoggedInEvent({@required this.user});
}
class LoggedOutEvent extends AuthEvent{}