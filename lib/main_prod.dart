import 'package:flutter_model/app_config.dart';
import 'package:flutter_model/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppConfig(
    appName: 'App Prod',
    apiBaseUrl: 'https://prod-api.example.com/',
    child: MyApp(),
  ));
}