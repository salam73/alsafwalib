import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/general_books/math_books.dart';

import '../Constant/constant.dart';

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
                InkWell(
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
                ),
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('فيزياء'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('قانون'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('إدارة أعمال'),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('هندسة'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('طب'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('فسلجه'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().mainClassColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('تمريض'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
