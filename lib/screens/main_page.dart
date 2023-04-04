import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/books.dart';
import 'package:alsafwalib/screens/research.dart';
import 'package:alsafwalib/screens/steps.dart';

import '../Constant/constant.dart';
import '../Constant/general_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  getItems(){
    final CollectionReference books=FirebaseFirestore.instance.collection('books/0iLCBezOPlIbnjLNqth0/users');

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'الصفحة الرئيسية'),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              InkWell(
                onTap: (){
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>const Steps())
                  );
                },
                child:  Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 300,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [

                        Text('💻 ', style: TextStyle(fontSize: 30),),
                        Text('هندسة تنقنيات الحاسوب'),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context)=>const Research())
                      );
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

                   InkWell(
                     onTap: (){
                       Navigator.push(
                           context,MaterialPageRoute(builder: (context)=>const Books())
                       );
                     },
                     child: Card(
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
                  ),
                   ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
