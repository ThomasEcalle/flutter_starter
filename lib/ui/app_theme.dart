import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _Colors {
  Color get black => Color(0xff000000);

  Color get white => Color(0xffffffff);

  Color get grey => Color(0xff9e9e9e);
}

class _Values {
  BorderRadius get defaultBorderRadius => BorderRadius.circular(5.0);
}

class _Icons {}

class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  TextStyle get title => TextStyle(
        color: Colors.grey,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.2,
      );

  TextStyle get button => TextStyle(
        color: colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.94,
      );

  TextStyle get display1 => TextStyle(
        color: colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );

  TextStyle get display2 => TextStyle(
        color: colors.grey,
        fontSize: 14,
      );
}

// ignore: must_be_immutable
class AppTheme extends InheritedWidget {
  final _Colors colors = _Colors();

  final _Values values = _Values();

  final _Icons icons = _Icons();

  _TextStyles textStyles;

  AppTheme({
    @required Widget child,
  }) : super(child: child) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppTheme);
  }
}
