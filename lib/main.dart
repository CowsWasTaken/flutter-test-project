import 'package:flutter/material.dart';
import 'package:test_project/randomNameGenerator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Superhero App", // home: SuperHeroGenerator(),
        home: RandomNameGenerator());
  }
}
