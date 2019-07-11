import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoggedInEvent extends AuthenticationEvent {}

class LogOutEvent extends AuthenticationEvent {}
