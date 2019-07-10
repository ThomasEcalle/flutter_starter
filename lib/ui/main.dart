import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/favorites/bloc.dart';
import 'package:flutter_model/core/blocs/posts/bloc.dart';
import 'package:flutter_model/core/translations.dart';
import 'package:flutter_model/ui/home.dart';
import 'package:flutter_model/ui/router.dart';

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
        BlocProvider<PostsBloc>(builder: (BuildContext context) => PostsBloc()..dispatch(RetrievePosts())),
        BlocProvider<FavoritesBloc>(builder: (BuildContext context) => FavoritesBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                display1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                display2: TextStyle(color: Colors.grey, fontSize: 14))),
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('fr', ''),
        ],
        onGenerateRoute: Router.generateRoute,
        home: Home(),
      ),
    );
  }
}
