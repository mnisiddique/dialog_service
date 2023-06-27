import 'package:dialog_service/src/system_back_button_aware_wdget.dart';
import 'package:flutter/material.dart';

import 'app_dialog.dart';

abstract class AlertService {
  bool get isAlertShowing;
  Future<T?> showAlert<T>(
    BuildContext context,
    AppAlert alert,
  );
}

class AlertServiceImpl implements AlertService {
  bool _isShowing = false;
  @override
  Future<T?> showAlert<T>(
    BuildContext context,
    AppAlert alert,
  ) {
    if (_isShowing) {
      return Future.value();
    }
    _isShowing = true;
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
      _isShowing = false;
      return value;
    });
  }

  @override
  bool get isAlertShowing => _isShowing;
}

class AlertServiceSystemBackInterceptionAwareImpl implements AlertService {
  bool _isShowing = false;
  @override
  Future<T?> showAlert<T>(
    BuildContext context,
    AppAlert alert,
  ) {
    if (_isShowing) {
      return Future.value();
    }
    _isShowing = true;
    return showDialog<T>(
      context: context,
      barrierDismissible: alert.config.barrierDismissible,
      barrierColor: alert.config.barrierColor,
      barrierLabel: alert.config.barrierLabel,
      useSafeArea: alert.config.useSafeArea,
      useRootNavigator: alert.config.useRootNavigator,
      routeSettings: alert.config.routeSettings,
      anchorPoint: alert.config.anchorPoint,
      builder: (BuildContext context) =>
          SystemBackInterceptionAwareWidget(child: alert.build()),
    ).then((value) {
      _isShowing = false;
      return value;
    });
  }

  @override
  bool get isAlertShowing => _isShowing;
}
