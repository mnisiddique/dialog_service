import 'package:flutter/material.dart';

import 'app_dialog.dart';

abstract class AlertService {
  Future<T?> showAlert<T>(
    BuildContext context,
    AppAlert alert,
  );
}

class AlertServiceImpl implements AlertService {
  bool isShowing = false;
  @override
  Future<T?> showAlert<T>(
    BuildContext context,
    AppAlert alert,
  ) {
    if (isShowing) {
      return Future.value();
    }
    isShowing = true;
    return showDialog<T>(
      context: context,
      barrierDismissible: alert.config.barrierDismissible,
      barrierColor: alert.config.barrierColor,
      barrierLabel: alert.config.barrierLabel,
      useSafeArea: alert.config.useSafeArea,
      useRootNavigator: alert.config.useRootNavigator,
      routeSettings: alert.config.routeSettings,
      anchorPoint: alert.config.anchorPoint,
      builder: (BuildContext context) => alert.build(),
    ).then((value) {
      isShowing = false;
      return value;
    });
  }
}
