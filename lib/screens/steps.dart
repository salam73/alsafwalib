import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/levels/books_level_one.dart';
import 'package:alsafwalib/screens/levels/books_level_three.dart';
import 'package:alsafwalib/screens/levels/books_level_two.dart';

import '../Constant/constant.dart';
import '../Constant/general_widget.dart';
import 'package:get/get.dart';

import 'levels/books_level_four.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'هندسة تقنيات الحاسوب'),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getMarhala('المرحلة الاولى', const BooksLevelOne()),
                getMarhala('المرحلة الثانية', const BooksLevelTwo()),
                getMarhala('المرحلة الثالثة', const BooksLevelThree()),
                getMarhala('المرحلة الرابعة', const BooksLevelFour()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getMarhala(String title, Widget name) {
    return InkWell(
      onTap: () {
        Get.to(name);
      },
      child: Card(
        color: Constant().classLibraryColor,
        child: SizedBox(
          width: 300,
          height: 60,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
