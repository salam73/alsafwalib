import 'package:alsafwalib/api_connection/notion_api.dart';
import 'package:alsafwalib/screens/admin_page.dart';
import 'package:alsafwalib/screens/firebase_screen.dart';
import 'package:alsafwalib/screens/home_page.dart';
import 'package:alsafwalib/screens/main_page.dart';
import 'package:alsafwalib/screens/user_page.dart';
import 'package:alsafwalib/views/pickup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 // final Future<FirebaseApp> _init=Firebase.initializeApp();

//salam alukum
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      // PickUpScreen()
     // FirebaseScreen(part: 'تحليلات',)
     // HomePge()

       // MainPage()
      //   NotionApi(),
      UserPage()
    );
  }
}
