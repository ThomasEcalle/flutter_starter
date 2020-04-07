import 'package:equatable/equatable.dart';
import 'package:cleyade/core/models/post.dart';

abstract class PostsState extends Equatable {
  PostsState([List<dynamic> props = const <dynamic>[]]) : super(props);
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
