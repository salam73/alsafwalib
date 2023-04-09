import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/level_one/books_level_one.dart';
import 'package:alsafwalib/screens/level_three/books_level_three.dart';
import 'package:alsafwalib/screens/level_two/books_level_two.dart';

import '../Constant/constant.dart';
import '../Constant/general_widget.dart';
import 'level_four/books_level_four.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          appBar: GeneralWidget.MyAppBar(name: 'هندسة تقنيات الحاسوب'),


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BooksLevelOne()));
                },
                child: Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 300,
                    height: 60,
                    child: Center(
                      child: Text('المرحلة الاولى'),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BooksLevelTwo()));
                },
                child: Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 300,
                    height: 60,
                    child: Center(
                      child: Text('المرحلة الثانية'),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BooksLevelThree()));
                },
                child: Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 300,
                    height: 60,
                    child: Center(
                      child: Text('المرحلة الثالثة'),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BooksLevelFour()));
                },
                child: Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 300,
                    height: 60,
                    child: Center(
                      child: Text('المرحلة الرابعة'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
