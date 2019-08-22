import 'package:flutter/material.dart';
import 'package:flutter_model/core/translations/i18n.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(I18n.of(context).appTitle(title: I18n.of(context).title, versionNumber: 1)),
        ),
      ),
    );
  }
}
