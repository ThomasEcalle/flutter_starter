import 'package:flutter_model/core/models/post.dart';

abstract class FavoritesState {
  FavoritesState([List props = const []]);
}

class FavoritesChanged extends FavoritesState {
  final List<Post> favorites;

  FavoritesChanged(this.favorites);

  @override
  String toString() => 'FavoritesChanged { favorites = ${favorites.toString()} }';
}

class FavoritesInitialState extends FavoritesState {
  @override
  String toString() => 'FavoritesInitialState';
}
