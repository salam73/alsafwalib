import 'package:alsafwalib/api_connection/notion_api.dart';
import 'package:alsafwalib/screens/main_page.dart';
import 'package:alsafwalib/screens/user_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//salam alukum
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  NotionApi(),
    );
  }
}

