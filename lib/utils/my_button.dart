import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // Variable
  final String name;
  final VoidCallback onPressed;

  // constructor
  const MyButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.amber,
      child: Text(name),
    );
  }
}
