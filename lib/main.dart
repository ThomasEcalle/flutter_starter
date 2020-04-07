import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cleyade/core/blocs/authentication/authentication_bloc.dart';
import 'package:cleyade/core/blocs/favorites/bloc.dart';
import 'package:cleyade/core/translations/i18n.dart';
import 'package:cleyade/ui/authentication.dart';
import 'package:cleyade/ui/router.dart';

import 'ui/app_theme.dart';

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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoritesBloc>(
          builder: (BuildContext context) => FavoritesBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: AppTheme(
        child: MaterialApp(
          localizationsDelegates: [
            const I18nDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('fr', ''),
          ],
          onGenerateRoute: Router.generateRoute,
          home: Authentication(),
        ),
      ),
    );
  }
}
