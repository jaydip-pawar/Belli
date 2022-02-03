import 'package:belli/constants.dart';
import 'package:belli/screens/splash_screen.dart';
import 'package:belli/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Grocery',
      theme: theme(),
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
