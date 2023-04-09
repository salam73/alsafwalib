import 'package:alsafwalib/Constant/constant.dart';
import 'package:flutter/material.dart';

import '../../Constant/general_widget.dart';

class BooksLevelOne extends StatelessWidget {
  const BooksLevelOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'المرحلة الاولى'),

        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  nameWidget(
                      name: 'اسس الهندسة الكهربائية',
                      path:
                          'https://drive.google.com/drive/folders/18FnjMoWb_WreqA6hXCJBDnj0mbTmML6A'),
                  nameWidget(
                      name: 'الرسم الهندسي',
                      path:
                          'https://drive.google.com/drive/folders/1QvYNSmhYTnRZ2fEM9ytJHWKlXTiFClgl'),
                  nameWidget(
                      name: 'الكترونيك رقمي',
                      path:
                          'https://drive.google.com/drive/folders/1aE-4KPo9xEq_5m3ZPpx0qs1Hfll-I4Nw'),
                  nameWidget(
                      name: 'اللغة الانكليزية',
                      path:
                          'https://drive.google.com/drive/folders/14zWim84JNUA40Cx8afS544xv0yx1b5vS'),

                  /*
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
                  ),*/
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  nameWidget(
                      name: 'برمجة ',
                      path:
                          'https://drive.google.com/drive/folders/1TpeaPat6b0knu-Cug0dKJlInFjjUqwQ9'),
                  nameWidget(
                      name: 'تركيب الحاسوب',
                      path:
                          'https://drive.google.com/drive/folders/1jbX4ZCedKWuLfR5Jv3jT5wuVd3B1JmFx'),
                  nameWidget(
                      name: 'حقوق الانسان',
                      path:
                          'https://drive.google.com/drive/folders/1Zwh1OphrMcFKUrGT0AFe4uA3uf4EiaSo'),
                  nameWidget(
                      name: 'رياضيات',
                      path:
                          'https://drive.google.com/drive/folders/1AHlTC-Zo5zjFA-ZS4ZITEdVY-jf5_BjF'),

                  /*
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
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  nameWidget({String? name, String? path}) {
    return InkWell(
      onTap: () => Constant().myLaunchUrl(path!),
      child: Card(
        color: Constant().classLibraryColor,
        child: SizedBox(
          width: 150,
          height: 60,
          child: Center(child: Text(name!)),
        ),
      ),
    );
  }
}
