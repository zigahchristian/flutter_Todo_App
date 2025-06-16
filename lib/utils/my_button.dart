import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // Variable
  final String name;
  final VoidCallback onPressed;
  final Color buttonColor;

  // constructor
  const MyButton({
    super.key,
    required this.name,
    required this.onPressed,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      child: Text(name),
    );
  }
}
