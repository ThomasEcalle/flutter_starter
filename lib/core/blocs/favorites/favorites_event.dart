import 'package:equatable/equatable.dart';
import 'package:flutter_model/core/models/post.dart';

abstract class FavoritesEvents extends Equatable {}

class ToggleFavorite extends FavoritesEvents {
  final Post post;

  ToggleFavorite(this.post);

  @override
  String toString() => 'ToggleFavorite { post = $post }';
}
