import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_model/core/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_model/core/blocs/authentication/authentication_event.dart';
import 'package:flutter_model/core/services/api_services.dart';

import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;

  LoginBloc(this._authenticationBloc);

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LogUserIn) {
      yield LoginLoading();
      try {
        final token = await ApiServices.login(event.userName, event.password);
        await ApiServices.persistToken(token);
        _authenticationBloc.dispatch(LoggedInEvent());
      } catch (error) {
        yield LoginError(error);
      }
    }
  }
}
