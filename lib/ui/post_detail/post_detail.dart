import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/favorites/favorites_bloc.dart';
import 'package:flutter_model/core/blocs/favorites/favorites_event.dart';
import 'package:flutter_model/core/models/post.dart';

class PostDetail extends StatefulWidget {
  static const String routeName = "/PostDetail";
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool _isFavorite = false;

  @override
  initState() {
    super.initState();
    _isFavorite = BlocProvider.of<FavoritesBloc>(context).isPostInFavorites(widget.post);
  }

  _toggleFavorite() {
    BlocProvider.of<FavoritesBloc>(context).dispatch(ToggleFavorite(widget.post));
    setState(() {
      this._isFavorite = !_isFavorite;
    });
  }

  _buildFavoriteIcon(BuildContext context) {
    return _isFavorite
        ? IconButton(icon: Icon(Icons.favorite), onPressed: () => _toggleFavorite())
        : IconButton(icon: Icon(Icons.favorite_border), onPressed: () => _toggleFavorite());
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
                style: Theme.of(context).textTheme.display2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
