import 'package:blink_eye_ytu/home_page.dart';
import 'package:blink_eye_ytu/login_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: null,
        builder: (_, snapshot) {
          final loginok = snapshot.hasData &&
              snapshot.data != null; // context ve snapshota bak tekrardan
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: loginok ? HomePage() : LoginPage(),
          );
        });
  }
}
