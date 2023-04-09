import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/level_one/books_level_one.dart';
import 'package:alsafwalib/screens/level_three/books_level_three.dart';
import 'package:alsafwalib/screens/level_two/books_level_two.dart';

import '../Constant/constant.dart';
import '../Constant/general_widget.dart';
import 'level_four/books_level_four.dart';
import 'package:get/get.dart';

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
              getMarhala( 'المرحلة الاولى', const BooksLevelOne()),
              getMarhala( 'المرحلة الثانية', const BooksLevelTwo()),
              getMarhala( 'المرحلة الثالثة', const BooksLevelThree()),
              getMarhala( 'المرحلة الرابعة', const BooksLevelFour()),


            ],
          ),
        ),
      ),
    );
  }


  getMarhala(String title,  Widget name){
   return  InkWell(
      onTap: () {
      Get.to(name);
      },
      child: Card(
        color: Constant().classLibraryColor,
        child:  SizedBox(
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
