import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/core/blocs/posts/bloc.dart';
import 'package:flutter_model/core/models/navigation_arguments/post_detail_arguments.dart';
import 'package:flutter_model/core/models/post.dart';
import 'package:flutter_model/ui/post_detail/post_detail.dart';
import 'package:flutter_model/ui/shared/shared.dart';

class PostsList extends StatelessWidget {
  _navigateToDetail(Post post, BuildContext context) {
    Navigator.of(context).pushNamed(PostDetail.routeName, arguments: PostDetailArguments(post));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<PostsBloc>(context),
        builder: (BuildContext context, PostsState state) {
          if (state is PostsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostsLoadingSuccess) {
            final posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostListItem(
                  post: posts[index],
                  onTap: () => _navigateToDetail(posts[index], context),
                );
              },
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
