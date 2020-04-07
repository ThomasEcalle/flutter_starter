import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleyade/core/blocs/posts/bloc.dart';
import 'package:cleyade/core/models/navigation/arguments/post_detail_arguments.dart';
import 'package:cleyade/core/models/post.dart';
import 'package:cleyade/ui/authenticated/post_detail/post_detail.dart';
import 'package:cleyade/ui/shared/shared.dart';

class PostsList extends StatelessWidget {
  final Completer<void> _refreshCompleter = Completer<void>();

  void _navigateToDetail(Post post, BuildContext context) {
    Navigator.of(context).pushNamed(
      PostDetail.routeName,
      arguments: PostDetailArguments(post),
    );
  }

  Widget _buildList(List<Post> posts, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<PostsBloc>(context).dispatch(RefreshPosts());
        return _refreshCompleter.future;
      },
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostListItem(
            post: posts[index],
            onTap: () => _navigateToDetail(posts[index], context),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: BlocProvider.of<PostsBloc>(context),
        listener: (BuildContext context, PostsState state) {
          if (state is RefreshSuccess) {
            _refreshCompleter.complete();
          }
        },
        child: BlocBuilder(
          bloc: BlocProvider.of<PostsBloc>(context),
          builder: (BuildContext context, PostsState state) {
            if (state is PostsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostsLoadingSuccess) {
              return _buildList(state.posts, context);
            } else if (state is RefreshSuccess) {
              return _buildList(state.posts, context);
            } else if (state is PostsLoadingError) {
              final error = state.error;
              if (error is SocketException) {
                return Center(
                  child: NoNetwork(
                    onRetry: () => BlocProvider.of<PostsBloc>(context).dispatch(
                      RetrievePosts(),
                    ),
                  ),
                );
              }
              return Center(
                child: Text('Server error'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
