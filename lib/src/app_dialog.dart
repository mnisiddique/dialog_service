import 'package:dialog_service/src/dialog_config.dart';
import 'package:flutter/material.dart';

abstract class _AppDialog<T extends Widget> {
  T build();
}

abstract class AppAlert implements _AppDialog<AlertDialog> {
  AlertConfig config = AlertConfig();
}

abstract class AppBottomSheet implements _AppDialog<Widget> {
  BottomSheetConfig config = BottomSheetConfig();
}
