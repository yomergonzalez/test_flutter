import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

enum ThemeEvent { change, reset }

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => LightTheme();

  void changeTheme(){
    add(ThemeEvent.change);
  }

  void resetTheme(){
    add(ThemeEvent.reset);
  }


  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {

    if(event ==ThemeEvent.reset){
      yield LightTheme();

    }else {

      if(state is LightTheme){
        yield DarkTheme();
      }else{
        yield LightTheme();
      }

    }
  }
}
