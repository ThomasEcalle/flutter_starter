import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}

class LogUserIn extends LoginEvent {
  final String userName;
  final String password;

  LogUserIn(this.userName, this.password);
}
