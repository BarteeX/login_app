import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/api/login_provider.dart';
import 'package:login_app/api/login_repository.dart';
import 'package:login_app/bloc_login/login_bloc.dart';
import 'package:login_app/bloc_login/login_event.dart';
import 'package:login_app/bloc_login/login_state.dart';

class MocLoginProvider extends LoginProvider {
  @override
  Future<bool> login({String userName, String password}) async {
    if (userName == 'bwa' && password == '123') {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  test("bloc test", () {
    LoginProvider loginProvider = MocLoginProvider();
    LoginRepository loginRepository = LoginRepository(
      loginProvider: loginProvider,
    );
    LoginBloc loginBloc = LoginBloc(loginRepository: loginRepository);

    List<LoginState> expected = [
      InitialState(),
      LoginFailure(),
      LoginSuccess(),
    ];

    expectLater(loginBloc.cast<LoginState>(), emitsInOrder(expected));

    loginBloc.add(AttemptToLogin(
      userName: '',
      password: '',
    ));

    loginBloc.add(AttemptToLogin(
      userName: 'bwa',
      password: '123',
    ));
  });
}
