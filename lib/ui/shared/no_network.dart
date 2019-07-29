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
        Text(I18n.networkErrorTitle(context)),
        RaisedButton(
          child: Text(I18n.retry(context)),
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
