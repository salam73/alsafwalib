import 'package:flutter/material.dart';

import '../../Constant/constant.dart';

class BooksLevelTwo extends StatelessWidget {
  const BooksLevelTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المرحلة الثانية'),),
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
                    child: Center(child: Text('الرياضيات')),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('الكترونيك'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('اتصالات '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('برمجة 2 '),
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
                      child: Text(' معالجات'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('تطبيقات الحاسوب '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('أجهزة وقياسات'),
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
