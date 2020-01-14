import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post(this.id, this.title, this.body) : super([id]);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json['id'] as int ?? 0,
      json['title'] as String ?? '',
      json['body'] as String ?? '',
    );
  }
}
