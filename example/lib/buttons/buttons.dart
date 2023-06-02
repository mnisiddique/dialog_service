import 'package:flutter/material.dart';

class NegativeActionButton extends StatelessWidget {
  final String text;
  const NegativeActionButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        text,
        style: negativeLabelStyle,
      ),
      onPressed: () => Navigator.of(context).pop(false),
    );
  }
}

class PositiveActionButton extends StatelessWidget {
  final String text;
  const PositiveActionButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xff0C5F20),
      child: Text(
        text,
        style: positiveLabelStyle,
      ),
      onPressed: () => Navigator.of(context).pop(true),
    );
  }
}

class BottomSheetExampleButton extends StatelessWidget {
  final Function()? onPressed;
  const BottomSheetExampleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: onPressed,
      child: const Text(
        "Bottomsheet Example",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class AlertExampleButton extends StatelessWidget {
  final Function()? onPressed;
  const AlertExampleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: onPressed,
      child: const Text(
        "Alert Example",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

const kLabelExit = "EXIT";
const kLabelCancel = "Cancel";
const kLabelOK = "Ok";

const TextStyle positiveLabelStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
  color: Colors.white,
);
const TextStyle negativeLabelStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
  color: Color(0xff0C5F20),
);
const TextStyle exitLabelStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
  color: Colors.white,
);
