import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/bloc_login/login_bloc.dart';
import 'package:login_app/bloc_login/login_event.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _controllerLogin;
  TextEditingController _controllerPassword;

  @override
  void initState() {
    super.initState();
    _controllerLogin = TextEditingController(text: 'qwe');
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _controllerLogin,
          decoration: InputDecoration(
            labelText: 'login',
          ),
        ),
        TextFormField(
          controller: _controllerPassword,
          decoration: InputDecoration(
            labelText: 'password',
          ),
        ),
        FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('proceed'),
              SizedBox(width: 10),
              Icon(Icons.polymer),
            ],
          ),
          onPressed: () {
            String userName = _controllerLogin.text;
            String password = _controllerPassword.text;
            LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
            bloc.add(AttemptToLogin(
              userName: userName,
              password: password,
            ));
          },
        )
      ],
    );
  }
}
