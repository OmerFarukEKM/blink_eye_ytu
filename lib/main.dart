import 'package:blink_eye_ytu/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  print("Hello World");
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  // herşeyin düzgün olduğundan emin ol anlamına geliyor
  // try {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform); // bu olmaz ise çalışmaz
  //   // bunu kullanabilmek için feture kısmını ekledik ve async yaptık // current platform hangi platforma çağrılırsa onun ayarlarını getir burdan fairbase bizim kim olduğumuzu bilir
  // } catch (error) {
  //   print(error);
  // }
  FlutterNativeSplash.remove();
  runApp(HomePage());
}


// cors ayarları yapılamadı google kısmına tekrardan bak 