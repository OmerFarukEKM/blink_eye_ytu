import 'package:blink_eye_ytu/home_page.dart';
import 'package:blink_eye_ytu/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final isLoggedIn = snapshot.hasData;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? HomePage() : LoginPage(),
        );
      },
    );
  }
}
