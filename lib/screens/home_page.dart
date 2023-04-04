import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Constant/constant.dart';
import '../Constant/general_widget.dart';
import '../views/add_books.dart';
import '../views/add_research.dart';

class HomePge extends StatelessWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name:'اختر القسم',),
        body: Center(
            child: Container(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddBooks()));
              },
              child:  Card(
                color: Constant().mainClassColor,
                child: SizedBox(
                  width: 150,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('📚', style: TextStyle(fontSize: 30),),
                      Text('كتـــــب عامـــــــــة'),
                    ],
                  ),
                ),
              )
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddResearch()));
              },
              child:  Card(
                color: Constant().researchBooksColor,
                child: SizedBox(
                  width: 150,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('🎓', style: TextStyle(fontSize: 30),),
                      Text('بـــــحوث التـــــخرج'),
                    ],
                  ),
                ),
              ),
            ),
          ],
         ),
        )),
      ),
    );
  }
}
