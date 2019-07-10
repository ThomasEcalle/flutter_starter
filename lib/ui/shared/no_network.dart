import 'package:flutter/material.dart';
import 'package:flutter_model/core/translations.dart';

class NoNetwork extends StatelessWidget {
  final VoidCallback onRetry;

  const NoNetwork({Key key, @required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(Translations.of(context).text("network_error_title")),
        RaisedButton(
          child: Text(Translations.of(context).text("retry")),
          onPressed: () {
            if (this.onRetry != null) {
              this.onRetry();
            }
          },
        )
      ],
    );
  }
}
