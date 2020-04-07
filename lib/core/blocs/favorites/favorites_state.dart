import 'package:cleyade/core/models/post.dart';

abstract class FavoritesState {}

class FavoritesChanged extends FavoritesState {
  final List<Post> favorites;

  FavoritesChanged(this.favorites);

  @override
  String toString() {
    return 'FavoritesChanged { favorites = ${favorites.toString()} }';
  }
}

class FavoritesInitialState extends FavoritesState {
  @override
  String toString() => 'FavoritesInitialState';
}
