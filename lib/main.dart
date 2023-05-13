import 'package:alsafwalib/screens/books_list.dart';
import 'package:alsafwalib/screens/home_page.dart';
import 'package:alsafwalib/screens/research_list.dart';
import 'package:alsafwalib/screens/steps.dart';
import 'package:alsafwalib/screens/user_page.dart';
import 'package:alsafwalib/views/add_books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'screens/admin_page.dart';
import 'package:get/get.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      title: 'مكتبة الصفوة',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.cairoTextTheme(textTheme).copyWith(
          bodySmall: GoogleFonts.cairo(
              textStyle: textTheme.bodySmall, fontWeight: FontWeight.bold),
          bodyLarge: GoogleFonts.cairo(
              textStyle: textTheme.bodySmall,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),

      home:
          // PickUpScreen()
          // FirebaseScreen(part: 'تحليلات',)
          // HomePge()

          // MainPage()
          //   NotionApi(),
          //  const UserPage()
          // Books()
          const UserPage(),

      // const HomePge()
      //   const AddBooks()
      //BooksList(part: 'تخدير')
      // ResearchList(part: 'تخدير')
      //  ExamplePage()
    );
  }
}
//hello word
