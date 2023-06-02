import 'package:dialog_service/dialog_service.dart';
import 'package:example/buttons/buttons.dart';
import 'package:flutter/material.dart';

class WillPopScopeAlert extends AppAlert {
  WillPopScopeAlert() {
    config = config.copyWith(barrierDismissible: false);
  }
  @override
  AlertDialog build() {
    return const AlertDialog(
      title: Text(kLabelAreYoySure),
      content: Text(_kLabelWantToGoBack),
      titleTextStyle: titleStyle,
      contentTextStyle: contentStyle,
      contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 16.0),
      titlePadding: EdgeInsets.only(left: 16.0, top: 20.0),
      actions: [
        NegativeActionButton(text: kLabelCancel),
        PositiveActionButton(text: kLabelOK),
      ],
    );
  }
}

const String kLabelAlert = "Alert!";
const String kLabelAreYoySure = "Are You Sure?";
const String _kLabelWantToGoBack = "You want to go back";

const TextStyle titleStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  color: Colors.black,
);

const TextStyle contentStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  color: Colors.blueGrey,
);
