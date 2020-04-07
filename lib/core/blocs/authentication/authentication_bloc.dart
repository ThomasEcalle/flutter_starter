import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cleyade/core/services/api_services.dart';

import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final hasToken = await ApiServices.hasToken();
      yield (hasToken ? Authenticated() : UnAuthenticated());
    }

    if (event is LoggedInEvent) {
      yield Authenticated();
    }

    if (event is LogOutEvent) {
      await ApiServices.clearTokens();
      yield UnAuthenticated();
    }
  }
}
