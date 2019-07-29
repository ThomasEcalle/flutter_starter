import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme extends InheritedWidget {
  AppTheme({
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppTheme);
  }

  get title => TextStyle();

  get subtitle => TextStyle();

  get subhead => TextStyle();

  get overline => TextStyle();

  get headline => TextStyle();

  get display1 => TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);

  get display2 => TextStyle(color: Colors.grey, fontSize: 14);

  get display3 => TextStyle();

  get display4 => TextStyle();

  get body1 => TextStyle();

  get body2 => TextStyle();

  get caption => TextStyle();

  get button => TextStyle();
}
