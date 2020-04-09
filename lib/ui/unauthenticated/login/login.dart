import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_model/core/blocs/login/bloc.dart';
import 'package:flutter_model/core/blocs/login/login_bloc.dart';
import 'package:flutter_model/core/translations/i18n.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          I18n.of(context).appTitle(
            title: I18n.of(context).title,
            versionNumber: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          builder: (BuildContext context) {
            return LoginBloc(BlocProvider.of<AuthenticationBloc>(context));
          },
          child: LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.dispatch(LogUserIn(
      emailController.text,
      passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<LoginBloc>(context),
      builder: (BuildContext context, LoginState state) {
        Widget bottomWidget = Container();
        if (state is LoginLoading) {
          bottomWidget = CircularProgressIndicator();
        } else if (state is LoginError) {
          bottomWidget = Text('Error');
        }
        return Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: I18n.of(context).emailHint,
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: I18n.of(context).passwordHint,
                ),
              ),
              RaisedButton(
                child: Text('OK'),
                onPressed: () => _login(context),
              ),
              bottomWidget
            ],
          ),
        );
      },
    );
  }
}
