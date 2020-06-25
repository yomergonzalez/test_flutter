import 'package:meta/meta.dart';

@immutable
abstract class RequestEvent {}

class StartRequestEvent  extends RequestEvent {}

class FinishRequest  extends RequestEvent {
  final dynamic data;
  FinishRequest(this.data);
}

class ErrorRequest  extends RequestEvent {
  final String message;
  ErrorRequest(this.message);
}
