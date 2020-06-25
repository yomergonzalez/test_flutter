import 'package:meta/meta.dart';

@immutable
abstract class RequestState {
  final bool loading = false;
}

class InitialRequestState extends RequestState {}

class LoadingRequestState extends RequestState {
  final bool loading = true;
}

class SuccessRequestState extends RequestState {
  final dynamic data;
  SuccessRequestState(this.data);
}

class ErrorRequestState extends RequestState {
  final String message;
  ErrorRequestState(this.message);
}
