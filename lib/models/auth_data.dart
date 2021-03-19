import 'package:orion_client/orion_client.dart';

enum AuthMode {
  LOGIN,
  SIGNUP,
}

class AuthData {
  String name;
  String email;
  String password;
  AuthMode _mode = AuthMode.LOGIN;

  bool get isSignup {
    return _mode == AuthMode.SIGNUP;
  }

  bool get isLogin {
    return _mode == AuthMode.LOGIN;
  }

  void toggleMode() {
    _mode = _mode == AuthMode.LOGIN ? AuthMode.SIGNUP : AuthMode.LOGIN;
  }

  Future<void> signup(String email, String name, String password) async {
    final url = new UsersWebService(false, true);

    final response = await url.createUser(name, email, password);
    return response;
  }

  Future<void> login(String email, String password) async {
    final url = new UsersWebService(false, true);

    final response = await url.login(email, password);
    return response;
  }
}
