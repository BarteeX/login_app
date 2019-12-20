import 'package:bloc/bloc.dart';
import 'package:login_app/api/login_repository.dart';
import 'package:login_app/bloc_login/login_event.dart';
import 'package:login_app/bloc_login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({
    LoginRepository loginRepository,
  }) : _loginRepository = loginRepository ?? LoginRepository();

  @override
  LoginState get initialState => InitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AttemptToLogin) {
      String userName = event.userName;
      String password = event.password;
      LoginState state = await _loginRepository.login(
        userName: userName,
        password: password,
      );
      yield state;
    }
  }
}
