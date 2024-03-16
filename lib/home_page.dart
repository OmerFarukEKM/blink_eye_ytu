import 'package:blink_eye_ytu/app_app_bar.dart';
import 'package:blink_eye_ytu/app_drawer.dart';
import 'package:blink_eye_ytu/widget/message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late ServerSocket serverSocket;
  // String receivedData = "Bekleniyor...";

  // @override
  // void initState() {
  //   super.initState();
  //   startServer();
  // }

  // startServer() async {
  //   serverSocket = await ServerSocket.bind('127.0.0.1', 12345);
  //   serverSocket.listen((Socket socket) {
  //     handleClient(socket);
  //   });
  // }

  // handleClient(Socket socket) {
  //   socket.listen(
  //     (List<int> data) {
  //       String message = String.fromCharCodes(data);
  //       setState(() {
  //         receivedData = message;
  //       });
  //     },
  //     onDone: () {
  //       socket.destroy();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(220, 243, 239, 239),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Message(),
          ),
        ),

        appBar: AppAppBar(),
        drawer: AppDrawer(),
        // drawerScrimColor: Color.fromARGB(179, 243, 239, 239), buna basınca diğer tarafın rengi değişiyor
      ),
    );
  }

//   @override
//   void dispose() {
//     serverSocket.close();
//     super.dispose();
//   }
}
