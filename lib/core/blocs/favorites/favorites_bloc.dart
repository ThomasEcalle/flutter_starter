import 'package:bloc/bloc.dart';
import 'package:flutter_model/core/models/post.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesState> {
  final List<Post> favorites = [];

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvents event) async* {
    if (event is ToggleFavorite) {
      final post = event.post;
      if (favorites.contains(post)) {
        favorites.remove(post);
      } else {
        favorites.add(post);
      }
      yield FavoritesChanged(favorites);
    }
  }

  @override
  FavoritesState get initialState => FavoritesInitialState();

  isPostInFavorites(Post post) {
    return this.favorites.contains(post);
  }
}
