import 'package:cleyade/core/blocs/authentication/authentication_bloc.dart';
import 'package:cleyade/core/blocs/favorites/bloc.dart';
import 'package:cleyade/core/translations/i18n.dart';
import 'package:cleyade/ui/authentication.dart';
import 'package:cleyade/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/app_theme.dart';

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
