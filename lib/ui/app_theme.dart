import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Colors
class _Colors {
  Color get black => Colors.black;

  Color get grey => Colors.grey;
}

/// Values
class _Values {}

/// Icons
class _Icons {}

/// TextStyles
class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  TextStyle get title => TextStyle();

  TextStyle get subtitle => TextStyle();

  TextStyle get subhead => TextStyle();

  TextStyle get overline => TextStyle();

  TextStyle get headline => TextStyle();

  TextStyle get display1 => TextStyle(color: colors.black, fontWeight: FontWeight.bold, fontSize: 18);

  TextStyle get display2 => TextStyle(color: colors.grey, fontSize: 14);

  TextStyle get display3 => TextStyle();

  TextStyle get display4 => TextStyle();

  TextStyle get body1 => TextStyle();

  TextStyle get body2 => TextStyle();

  TextStyle get caption => TextStyle();

  TextStyle get button => TextStyle();
}

class AppTheme extends InheritedWidget {
  AppTheme({
    @required Widget child,
  }) : super(child: child) {
    textStyles = _TextStyles(colors);
  }

  final _Colors colors = _Colors();
  final _Values values = _Values();
  final _Icons icons = _Icons();
  _TextStyles textStyles;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppTheme);
  }
}
