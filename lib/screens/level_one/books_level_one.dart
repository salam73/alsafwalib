import 'package:alsafwalib/Constant/constant.dart';
import 'package:alsafwalib/screens/level_one/math_level_one.dart';
import 'package:flutter/material.dart';

class BooksLevelOne extends StatelessWidget {
  const BooksLevelOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المرحلة الاولى'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(

                  /*
                    Navigator.push(
                        context,MaterialPageRoute(builder: (context)=>const MathLevelOne())
                    );*/

                  child: Card(
                    color: Constant().classLibraryColor,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(child: Text('الرياضيات')),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('الكترونيك رقمي '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text(' اسس الهندسة الكهربائية  '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('برمجة ١ '),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text(' الرسم الهندسي  '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('حقوق الانسان   '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('تركيب الحاسوب '),
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
