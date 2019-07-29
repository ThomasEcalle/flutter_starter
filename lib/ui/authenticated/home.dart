import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/posts/posts_bloc.dart';
import 'package:flutter_model/core/blocs/posts/posts_event.dart';
import 'package:flutter_model/core/translations.dart';

import 'favorites/favorites.dart';
import 'posts_list/posts_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  final List<Widget> tabs = [PostsList(), Favorites()];

  _onBottomBarSwitch(int _newIndex) {
    setState(() {
      this._index = _newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.appTitle(context)),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => PostsBloc()..dispatch(RetrievePosts()),
        child: IndexedStack(
          index: _index,
          children: tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Container(height: 0.0)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Container(height: 0.0)),
        ],
        onTap: (index) => _onBottomBarSwitch(index),
      ),
    );
  }
}
