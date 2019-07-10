import 'package:flutter/material.dart';
import 'package:flutter_model/core/models/navigation_arguments/post_detail_arguments.dart';
import 'package:flutter_model/ui/post_detail/post_detail.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final dynamicArguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case PostDetail.routeName:
        if (dynamicArguments is PostDetailArguments) {
          return MaterialPageRoute(builder: (BuildContext context) {
            return PostDetail(
              post: dynamicArguments.post,
            );
          });
        }
        break;
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          );
        });
    }
  }
}
