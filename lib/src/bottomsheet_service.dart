import 'package:flutter/material.dart';

import 'app_dialog.dart';

abstract class BottomSheetService {
  Future<T?> showBottomSheet<T>(
    BuildContext context,
    AppBottomSheet bottomSheet,
  );
}

class BottomSheetServiceImpl extends BottomSheetService {
  bool isShowing = false;
  @override
  Future<T?> showBottomSheet<T>(
      BuildContext context, AppBottomSheet bottomSheet) {
    if (isShowing) {
      return Future.value();
    }
    isShowing = true;
    return showModalBottomSheet<T>(
      backgroundColor: bottomSheet.config.backgroundColor,
      elevation: bottomSheet.config.elevation,
      shape: bottomSheet.config.shape,
      clipBehavior: bottomSheet.config.clipBehavior,
      constraints: bottomSheet.config.constraints,
      barrierColor: bottomSheet.config.barrierColor,
      isScrollControlled: bottomSheet.config.isScrollControlled,
      useRootNavigator: bottomSheet.config.useRootNavigator,
      isDismissible: bottomSheet.config.isDismissible,
      enableDrag: bottomSheet.config.enableDrag,
      routeSettings: bottomSheet.config.routeSettings,
      transitionAnimationController:
          bottomSheet.config.transitionAnimationController,
      anchorPoint: bottomSheet.config.anchorPoint,
      context: context,
      builder: (BuildContext ctx) => bottomSheet.build(),
    ).then((value) {
      isShowing = false;
      return value;
    });
  }
}
