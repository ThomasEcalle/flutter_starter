import 'package:flutter/material.dart';
import 'package:flutter_model/core/models/post.dart';

import '../app_theme.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const PostListItem({Key key, this.post, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          post.title,
          style: AppTheme.of(context).display1,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          post.body,
          style: AppTheme.of(context).display2,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          if (this.onTap != null) {
            this.onTap();
          }
        },
      ),
    );
  }
}
