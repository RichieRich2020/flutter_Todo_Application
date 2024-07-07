import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_todoapplication/heading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(useMaterial3: true), home: Heading());
  }
}
