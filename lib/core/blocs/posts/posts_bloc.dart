import 'package:bloc/bloc.dart';
import 'package:flutter_model/core/blocs/posts/posts_event.dart';
import 'package:flutter_model/core/blocs/posts/posts_state.dart';
import 'package:flutter_model/core/services/api_services.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is RetrievePosts) {
      yield PostsLoading();
      try {
        final posts = await ApiServices.getAllPosts();
        yield PostsLoadingSuccess(posts: posts);
      } catch (error) {
        yield PostsLoadingError(error);
      }
    }

    if (event is RefreshPosts) {
      try {
        final posts = await ApiServices.getAllPosts();
        yield RefreshSuccess(posts: posts);
      } catch (error) {
        yield PostsLoadingError(error);
      }
    }
  }

  @override
  PostsState get initialState => PostsInitialState();
}
