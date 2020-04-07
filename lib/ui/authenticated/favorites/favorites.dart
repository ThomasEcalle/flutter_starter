import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleyade/core/blocs/favorites/bloc.dart';
import 'package:cleyade/core/models/navigation/arguments/post_detail_arguments.dart';
import 'package:cleyade/core/models/post.dart';
import 'package:cleyade/ui/authenticated/post_detail/post_detail.dart';
import 'package:cleyade/ui/shared/shared.dart';

class Favorites extends StatelessWidget {
  void _navigateToDetail(Post post, BuildContext context) {
    Navigator.of(context).pushNamed(
      PostDetail.routeName,
      arguments: PostDetailArguments(post),
    );
  }

  Widget _emptyFavoritesWidget() {
    return Center(
      child: Text('No favorites'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder(
          bloc: BlocProvider.of<FavoritesBloc>(context),
          builder: (BuildContext context, FavoritesState state) {
            if (state is FavoritesInitialState) {
              return _emptyFavoritesWidget();
            } else if (state is FavoritesChanged) {
              final favorites = state.favorites;
              if (favorites.isEmpty) {
                return _emptyFavoritesWidget();
              } else {
                return ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PostListItem(
                      post: favorites[index],
                      onTap: () => _navigateToDetail(favorites[index], context),
                    );
                  },
                );
              }
            }
            return Container(); // Should not happen
          },
        ),
      ),
    ));
  }
}
