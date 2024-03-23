import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Blink Eye',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 24,
                //   ),
                // ),
                // SizedBox(height: 8),
                Image.asset(
                  "assets/blink_eye_ytu_logo.png",
                  height: 80, // Set the desired height
                  width: 80, // Set the desired width
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              // Ana sayfaya yönlendir
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            onTap: () {
              // Ayarlar sayfasına yönlendir
              Navigator.pushNamed(context, '/settings');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Yardım'),
            onTap: () {
              // Yardım sayfasına yönlendir
              Navigator.pushNamed(context, '/help');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Hakkında'),
            onTap: () {
              // Hakkında sayfasına yönlendir
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Çıkış'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Scaffold.of(context)
                  .closeDrawer(); // bunu koymamızın sebebi adam tekrar drawerdaki kapatma tuşuna basmasın diye
              // Hakkında sayfasına yönlendir
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
