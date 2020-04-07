import 'package:flutter/material.dart';
import 'package:flutter_model/core/models/navigation/arguments/post_detail_arguments.dart';

import 'authenticated/post_detail/post_detail.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final dynamicArguments = routeSettings.arguments;
    // Instantiate the default route here
    Widget route = Scaffold(
      body: Center(
        child: Text('No route defined for ${routeSettings.name}'),
      ),
    );
    switch (routeSettings.name) {
      case PostDetail.routeName:
        if (dynamicArguments is PostDetailArguments) {
          route = PostDetail(
            post: dynamicArguments.post,
          );
        }
        break;
    }
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) => route);
  }
}
