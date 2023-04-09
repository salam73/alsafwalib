import 'package:alsafwalib/screens/books_list.dart';
import 'package:alsafwalib/screens/home_page.dart';
import 'package:alsafwalib/screens/research_list.dart';
import 'package:alsafwalib/screens/user_page.dart';
import 'package:alsafwalib/views/add_books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/admin_page.dart';

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
          primarySwatch: Colors.amber,
        ),

        home:
            // PickUpScreen()
            // FirebaseScreen(part: 'تحليلات',)
            // HomePge()

            // MainPage()
            //   NotionApi(),
            //  const UserPage()
            // Books()
            const UserPage()
        // const HomePge()
        //   const AddBooks()
        //BooksList(part: 'تخدير')
        // ResearchList(part: 'تخدير')
        //  ExamplePage()
        );
  }
}
//hello word
