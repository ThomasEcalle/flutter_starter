import 'package:bloc/bloc.dart';
import 'package:cleyade/app_config.dart';
import 'package:cleyade/my_app.dart';
import 'package:flutter/material.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(AppConfig(
    appName: 'App Preprod',
    apiBaseUrl: 'https://preprod-api.example.com/',
    child: MyApp(),
  ));
}
