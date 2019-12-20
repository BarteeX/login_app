import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}
