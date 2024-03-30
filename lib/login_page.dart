import 'package:blink_eye_ytu/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _loading = false;
  var _errorMessage = "";
  var _email = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(44.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_errorMessage.isNotEmpty)
                Text(
                  "ERROR: $_errorMessage ",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              Column(children: [
                Image.asset(
                  "assets/register_pp.png",
                  height: 200,
                  width: 200,
                ),
                Text(
                  "Enter Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(142, 0, 0, 0)),
                ),
              ]),
              TextField(
                decoration: InputDecoration(hintText: "Enter email"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;

                  if (_errorMessage.isNotEmpty) {
                    _errorMessage = "";
                    setState(() {});
                  }
                },
              ),
              // SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(hintText: "Enter password"),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {
                  _password = value;

                  if (_errorMessage.isNotEmpty) {
                    _errorMessage = "";
                    setState(() {});
                  }
                },
              ),
              if (_loading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              else
                TextButton(
                  onPressed: () {
                    final regexExp = RegExp(
                        r"^[A-Za-z0-9._+\-\']+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$");
                    final isValid =
                        regexExp.hasMatch(_email) && _password.length > 5;
                    if (isValid) {
                      _loading = true;
                      setState(() {});
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .catchError((errorMessage) {
                        _errorMessage = errorMessage.toString();
                        _loading = false;
                        setState(() {});
                      });
                    } else {
                      _errorMessage = "Invalid email or password!";
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text("Login"),
                  ),
                ),
              Divider(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return RegisterPage();
                      },
                    ),
                  );
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
