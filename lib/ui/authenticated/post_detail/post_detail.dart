import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleyade/core/blocs/favorites/favorites_bloc.dart';
import 'package:cleyade/core/blocs/favorites/favorites_event.dart';
import 'package:cleyade/core/models/post.dart';

import '../../app_theme.dart';

class PostDetail extends StatefulWidget {
  static const String routeName = '/PostDetail';
  final Post post;

  const PostDetail({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    final FavoritesBloc favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    _isFavorite = favoritesBloc.isPostInFavorites(widget.post);
  }

  void _toggleFavorite() {
    final FavoritesBloc favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    favoritesBloc.dispatch(ToggleFavorite(widget.post));
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  IconButton _buildFavoriteIcon(BuildContext context) {
    return _isFavorite
        ? IconButton(
            icon: Icon(Icons.favorite),
            onPressed: _toggleFavorite,
          )
        : IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: _toggleFavorite,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title.substring(0, 5)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildFavoriteIcon(context),
              Text(
                widget.post.body,
                style: AppTheme.of(context).textStyles.display2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
