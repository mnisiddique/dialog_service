import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';

class SystemBackInterceptionAwareWidget extends StatefulWidget {
  final Widget child;
  const SystemBackInterceptionAwareWidget({
    super.key,
    required this.child,
  });

  @override
  State<SystemBackInterceptionAwareWidget> createState() =>
      _SystemBackInterceptionAwareWidgetState();
}

class _SystemBackInterceptionAwareWidgetState
    extends State<SystemBackInterceptionAwareWidget> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(_onBackIntercepted);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(_onBackIntercepted);
    super.dispose();
  }

  bool _onBackIntercepted(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.of(context).maybePop(); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
