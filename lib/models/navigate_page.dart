import 'package:belli/screens/home/main_screen.dart';
import 'package:belli/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigatePage extends StatefulWidget {
  static const String id = 'navigate-screen';

  @override
  _NavigatePageState createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        print("Successfully listened");
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (userSnapshot.hasData) {
          return MainScreen();
        }
        return LoginScreen();
      },
    );
  }
}
