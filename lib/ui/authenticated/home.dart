import 'package:flutter_model/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/posts/posts_bloc.dart';
import 'package:flutter_model/core/blocs/posts/posts_event.dart';
import 'package:flutter_model/core/translations/i18n.dart';

import 'favorites/favorites.dart';
import 'posts_list/posts_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  final List<Widget> tabs = [PostsList(), Favorites()];

  void _onBottomBarSwitch(int _newIndex) {
    setState(() {
      _index = _newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          I18n.of(context).appTitle(
            title: AppConfig.of(context).appName,
            versionNumber: 1,
          ),
        ),
      ),
      body: BlocProvider(
        builder: (BuildContext context) {
          return PostsBloc()..dispatch(RetrievePosts());
        },
        child: IndexedStack(
          index: _index,
          children: tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Container(height: 0.0),
          ),
        ],
        onTap: _onBottomBarSwitch,
      ),
    );
  }
}
