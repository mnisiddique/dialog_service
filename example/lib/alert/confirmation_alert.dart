import 'package:dialog_service/dialog_service.dart';
import 'package:example/alert/willpopscope_alert.dart';
import 'package:flutter/material.dart';

import '../buttons/buttons.dart';

class ConfirmationAlert extends AppAlert {
  @override
  AlertDialog build() {
    return const AlertDialog(
      title: Text(kLabelAreYoySure),
      content: Text(_kWantToConfirm),
      titleTextStyle: titleStyle,
      contentTextStyle: contentStyle,
      contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 16.0),
      titlePadding: EdgeInsets.only(left: 16.0, top: 20.0),
      actions: [
        NegativeActionButton(text: _kLabelNo),
        PositiveActionButton(text: _kLabelYes),
      ],
    );
  }
}

const _kWantToConfirm = "You want to confirm?";
const _kLabelNo = "No";
const _kLabelYes = "Yes";
