import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log("Attempted poping scope");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              AlertExampleButton(),
              BottomSheetExampleButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetExampleButton extends StatelessWidget {
  const BottomSheetExampleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      child: const Text(
        "Bottomsheet Example",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () {},
    );
  }
}

class AlertExampleButton extends StatelessWidget {
  const AlertExampleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      child: const Text(
        "Alert Example",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () {},
    );
  }
}
