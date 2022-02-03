import 'package:belli/screens/login/login_screen.dart';
import 'package:belli/screens/splash_screen.dart';
import 'package:flutter/material.dart';

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.id : (context) => const SplashScreen(),
  LoginScreen.id : (context) => LoginScreen(),
};