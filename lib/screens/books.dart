import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/general_books/math_books.dart';

import '../Constant/constant.dart';
import 'firebase_screen.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('كتب عامه'),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [
                sectionName(context,'هندسة'),
                sectionName(context,'قانون'),
                sectionName(context,'صيدلة'),
                sectionName(context,'تخدير'),
              /*  InkWell(
                  onTap: (){
                    Navigator.push(
                        context,MaterialPageRoute(builder: (context)=> MathBooks())
                    );
                  },
                  child:  Card(
                    color: Constant().mainClassColor,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(
                        child: Text('رياضيات'),
                      ),
                    ),
                  ),
                ),*/

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [
                sectionName(context,'تحليلات'),
                sectionName(context,'طب أسنان'),
                sectionName(context,'التربية الرياضية'),
                sectionName(context,'الادارة والاقتصاد'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  sectionName(context, name){
    return  InkWell(
      onTap: (){
        Navigator.push(
            context,MaterialPageRoute(builder: (context)=> FirebaseScreen(part: name,))
        );
      },
      child:  Card(
        color: Constant().mainClassColor,
        child: SizedBox(
          width: 150,
          height: 60,
          child: Center(
            child: Text(name),
          ),
        ),
      ),
    );
  }

}
