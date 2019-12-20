import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class AttemptToLogin extends LoginEvent {
  final String userName;
  final String password;

  AttemptToLogin({this.userName, this.password});

  @override
  List<Object> get props => [userName, password];
}
