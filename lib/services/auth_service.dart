import 'package:shared_preferences/shared_preferences.dart';
import 'models/user.dart';

class AuthService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// PERSISTE EL USUARIO LOCALMENTE
  Future<void> saveUserSession(User user) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('username', user.username);
  }

  /// VERIFICA EL USUARIO
  Future<User> checkSession() async {
    SharedPreferences prefs = await _prefs;
    if (prefs.containsKey('username')) {
      String username = prefs.getString('username');
      return User(username);
    }
    return null;
  }

  ///  LOGUEA AL USUARIO
  Future<User> loginUser(String username, String password) async {
    //fake request
    await Future.delayed(Duration(seconds: 2));

    if (password != '123456') {
      throw new Exception('Contraseña Incorrecta');
    }
    return User(username);
  }

  /// ELIMINA EL USUARIO LOCAL
  Future<void> logoutUser() async {
    SharedPreferences prefs = await _prefs;
    await prefs.remove('username');
  }
}
