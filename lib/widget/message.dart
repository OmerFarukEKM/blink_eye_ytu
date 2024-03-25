import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // Save the image path to shared preferences
        _saveImageToPrefs(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveImageToPrefs(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_image', imagePath);
  }

  Future<void> _loadImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('user_image');

    setState(() {
      if (imagePath != null) {
        _image = File(imagePath);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Load the previously selected image path
    _loadImageFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final info = FirebaseFirestore.instance.collection("users").doc(user.uid);

    return Column(
      children: [
        StreamBuilder<DocumentSnapshot>(
          stream: info.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            var name = snapshot.data?['name'];

            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50),
                  child: GestureDetector(
                    onTap: () {
                      // Open image picker when the profile picture is tapped
                      _getImage(ImageSource
                          .gallery); // Change to ImageSource.camera for taking a new photo
                    },
                    child: ClipOval(
                      child: Container(
                        width: 64,
                        height: 64,
                        color: Color.fromARGB(255, 221, 216, 237),
                        child: _image != null
                            ? Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset("assets/register_pp.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 20), // Sol kenar boşluğu eklendi
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'Name not available',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Buraya metninizi yazın",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
