import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/authentication/bloc.dart';
import 'package:flutter_model/ui/authenticated/home.dart';
import 'package:flutter_model/ui/unauthenticated/login/login.dart';
import 'package:flutter_model/ui/splashscreen.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.dispatch(AppStarted());
    return BlocBuilder(
      bloc: authenticationBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is UnAuthenticated) {
          return Login();
        } else if (state is Authenticated) {
          return Home();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
