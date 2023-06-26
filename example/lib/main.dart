import 'package:flutter/material.dart';

import 'alert/confirmation_alert.dart';
import 'alert/willpopscope_alert.dart';
import 'bottomsheet/contact_bottomsheet.dart';
import 'buttons/buttons.dart';
import 'dependency.dart';

void main() {
  Dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Service Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dialog Service Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? _isConfirmed;
  Contact? _contact;

  Future<void> onAlertExamplePressed() async {
    final isConfirmed = await alertService.showAlert<bool>(
      context,
      ConfirmationAlert(),
    );

    setState(() {
      _isConfirmed = isConfirmed;
    });
  }

  Future<void> onBottomsheetExamplePressed() async {
    final contact = await bottomSheetService.showBottomSheet(
      context,
      ContactBottomSheet(),
    );
    setState(() {
      _contact = contact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await alertService.showAlert(context, WillPopScopeAlert()) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _isConfirmed == null
                  ? const SizedBox()
                  : Text("Is Confirmed: $_isConfirmed"),
              AlertExampleButton(
                onPressed: onAlertExamplePressed,
              ),
              const SizedBox(height: 16.0),
              _contact == null
                  ? const SizedBox()
                  : Text("Name: ${_contact?.name}"),
              _contact == null
                  ? const SizedBox()
                  : Text("MobileNo: ${_contact?.mobileNo}"),
              BottomSheetExampleButton(
                onPressed: onBottomsheetExamplePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
