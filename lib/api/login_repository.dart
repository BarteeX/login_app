import 'package:login_app/api/login_provider.dart';
import 'package:login_app/bloc_login/login_state.dart';

class LoginRepository {
  final LoginProvider _provider;

  LoginRepository({
    LoginProvider loginProvider,
  }) : _provider = loginProvider ?? LoginProvider();

  Future<LoginState> login({String userName, String password}) async {
    bool success =
        await _provider.login(userName: userName, password: password);
    if (success) {
      return LoginSuccess();
    } else {
      return LoginFailure();
    }
  }
}
