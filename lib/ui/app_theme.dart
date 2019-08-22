import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _Colors {
  get black => Color(0xff000000);
  get white => Color(0xffffffff);
  get grey => Color(0xff9e9e9e);
}

class _Values {
  get defaultBorderRadius => BorderRadius.circular(5.0);
}

class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  get title => TextStyle(
        color: Colors.grey,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.2,
      );

  get button => TextStyle(
        color: colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.94,
      );

  get display1 => TextStyle(
        color: colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );

  get display2 => TextStyle(
        color: colors.grey,
        fontSize: 14,
      );
}

// ignore: must_be_immutable
class AppTheme extends InheritedWidget {
  final _Colors colors = _Colors();

  final _Values values = _Values();

  _TextStyles textStyles;

  AppTheme({
    @required Widget child,
  }) : super(child: child) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppTheme);
  }
}
