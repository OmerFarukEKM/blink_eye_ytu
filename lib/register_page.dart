import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late bool _loading;
  late String _errorMessage;
  late String _nameSurname;
  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _errorMessage = "";
    _nameSurname = "";
    _email = "";
    _password = "";
  }

  Widget _buildTextField(
    String hintText,
    TextInputType keyboardType,
    void Function(String) onChanged,
    bool isObscureText,
  ) {
    return TextField(
      decoration: InputDecoration(hintText: hintText),
      keyboardType: keyboardType,
      onChanged: (value) {
        onChanged(value);
        if (_errorMessage.isNotEmpty) {
          _errorMessage = "";
          setState(() {});
        }
      },
      obscureText: isObscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
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
                  "ERROR: $_errorMessage",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              Column(
                children: [
                  Image.asset(
                    "assets/register_pp.png",
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    "Create Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(142, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              _buildTextField(
                "Enter patient name and surname",
                TextInputType.name,
                (value) => _nameSurname = value,
                false,
              ),
              _buildTextField(
                "Enter e-mail",
                TextInputType.emailAddress,
                (value) => _email = value,
                false,
              ),
              SizedBox(height: 4),
              _buildTextField(
                "Enter password",
                TextInputType.visiblePassword,
                (value) => _password = value,
                true,
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
                    if (isValid && _nameSurname.isNotEmpty) {
                      _loading = true;
                      setState(() {});
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .catchError(
                        (errorMessage) {
                          _errorMessage = errorMessage.toString();
                          _loading = false;
                          setState(() {});
                        },
                      ).then((value) async {
                        final uid = value.user?.uid;
                        final userData = {
                          "name": _nameSurname,
                          "email": _email,
                          "registerDate": FieldValue.serverTimestamp(),
                        };
                        if (uid == null) {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .add(userData);
                        } else {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(uid)
                              .set(userData);
                        }
                        if (mounted) Navigator.of(context).pop();
                      });
                    } else {
                      _errorMessage =
                          "All e-mail address, password, name and surname information is required";
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text("Register"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
