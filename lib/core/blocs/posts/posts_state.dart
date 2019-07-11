import 'package:equatable/equatable.dart';
import 'package:flutter_model/core/models/post.dart';

abstract class PostsState extends Equatable {
  PostsState([List props = const []]) : super(props);
}

class PostsInitialState extends PostsState {
  @override
  String toString() => 'PostsInitialState';
}

class PostsLoading extends PostsState {
  @override
  String toString() => 'PostsLoading';
}

class PostsLoadingSuccess extends PostsState {
  PostsLoadingSuccess({this.posts});

  final List<Post> posts;

  @override
  String toString() => 'PostsLoadingSuccess { posts = ${posts.toString()} }';
}

class RefreshSuccess extends PostsState {
  RefreshSuccess({this.posts});

  final List<Post> posts;

  @override
  String toString() => 'PostsLoadingSuccess { posts = ${posts.toString()} }';
}

class PostsLoadingError extends PostsState {
  final Exception error;

  PostsLoadingError(this.error);

  @override
  String toString() => 'PostsLoadingError { error : $error }';
}
