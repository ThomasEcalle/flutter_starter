import 'package:flutter/material.dart';
import 'package:flutter_model/core/translations.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(I18n.appTitle(context)),
        ),
      ),
    );
  }
}
