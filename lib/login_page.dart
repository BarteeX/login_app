import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/bloc_login/login_bloc.dart';
import 'package:login_app/bloc_login/login_state.dart';
import 'package:login_app/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = LoginBloc();
    return BlocListener<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LoginFailure) {
          print('login failure');
        } else if (state is LoginSuccess) {
          print('login success');
        }
      },
      child: BlocProvider<LoginBloc>(
        create: (BuildContext context) => bloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Center(
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
