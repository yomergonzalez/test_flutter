import 'dart:async';
import 'package:animation/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  @override
  RequestState get initialState => InitialRequestState();
  AuthService _authService = AuthService();


  void loginUser(String username, String password) async {

    add(StartRequestEvent());
    try{
      var user = await _authService.loginUser(username, password);
      add(FinishRequest(user));
    }catch (e){
      add(ErrorRequest(e.message.toString()));
    }
  }


  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if (event is StartRequestEvent) {
      yield LoadingRequestState();
    }
    if (event is ErrorRequest) {
      yield ErrorRequestState(event.message);
    }
    if (event is FinishRequest) {
      yield SuccessRequestState(event.data);
    }
  }
}
