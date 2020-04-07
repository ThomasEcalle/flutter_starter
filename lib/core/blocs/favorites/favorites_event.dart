import 'package:equatable/equatable.dart';
import 'package:cleyade/core/models/post.dart';

abstract class FavoritesEvents extends Equatable {}

class ToggleFavorite extends FavoritesEvents {
  final Post post;

  ToggleFavorite(this.post);

  @override
  String toString() => 'ToggleFavorite { post = $post }';
}
