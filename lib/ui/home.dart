import 'package:flutter/material.dart';
import 'package:flutter_model/core/translations.dart';
import 'package:flutter_model/ui/favorites/favorites.dart';
import 'package:flutter_model/ui/posts_list/posts_list.dart';

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
        title: Text(Translations.of(context).text("app_title")),
      ),
      body: tabs[_index],
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
