import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {}

class RetrievePosts extends PostsEvent {
  @override
  String toString() => 'RetrievePosts';
}
