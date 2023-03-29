import 'package:alsafwalib/screens/user_page.dart';
import 'package:alsafwalib/views/add_books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final Future<FirebaseApp> _init=Firebase.initializeApp();

//salam alukum
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'مكتبة الصفوة',
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
            //  const UserPage()
            // Books()
            // AdminPage()
            const AddBooks()
        //  ExamplePage()
        );
  }
}
