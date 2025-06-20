import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nusiwomawor/todo_page.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Create Database
  var todos = await Hive.openBox('todos');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NUSIWORMAWOR - TODO',
      home: const TODO(),
      theme: ThemeData(primaryColor: Colors.yellow),
    );
  }
}
