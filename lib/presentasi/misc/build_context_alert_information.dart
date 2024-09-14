import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

extension BuildContextExtension on BuildContext {
  buildAlertInformation({
    required String title,
    required String subTitle,
  }) {
    showPlatformDialog(
      context: this,
      builder: (context) => BasicDialogAlert(
        title: Text(
          title,
        ),
        content: Text(
          subTitle,
        ),
        actions: <Widget>[
          defaultTargetPlatform == TargetPlatform.iOS
              ? BasicDialogAction(
                  title: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Container(),
        ],
      ),
    );
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.of(this).pop();
    // });
    Future.delayed(const Duration(seconds: 2), () {
      if (Navigator.of(this).canPop()) {
        Navigator.of(this).pop();
      }
    });
  }
}
