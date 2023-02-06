import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constant/constant.dart';

class BooksLevelThree extends StatelessWidget {
  const BooksLevelThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المرحلة الثالثه'),),
      body: Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children:  [
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(child: Text('اسس الشبكات')),
              ),
            ),
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('المحاكيات'),
                ),
              ),
            ),
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('اتصالات رقمية'),
                ),
              ),
            ),
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('قواعد بيانات'),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children:  [
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('زمن الحقيقي'),
                ),
              ),
            ),
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('معالجة الاشارة الرقمية'),
                ),
              ),
            ),
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('تحليلات هندسية'),
                ),
              ),
            ),
            Card(
              color: Constant().classLibraryColor,
              child: SizedBox(
                width: 150,
                height: 60,
                child: Center(
                  child: Text('اللغة الانكليزية'),
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
