import 'package:bloc/bloc.dart';
import 'package:cleyade/core/models/post.dart';

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

  bool isPostInFavorites(Post post) {
    return favorites.contains(post);
  }
}
