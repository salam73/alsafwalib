import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
import '../../Constant/general_widget.dart';

class BooksLevelThree extends StatelessWidget {
  const BooksLevelThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: GeneralWidget.MyAppBar(name: 'المرحلة الثالثة'),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      nameWidget(
                          name: 'المحاكيات',
                          path:
                              'https://drive.google.com/drive/folders/17OX349nsQLVI6wZBe0rpUpZ7wIT-Q3oy'),
                      nameWidget(
                          name: 'اتصالات رقمية',
                          path:
                              'https://drive.google.com/drive/folders/11B9cov_ZdKoWxH1A0jdt3YHDhCbNHSS4'),
                      nameWidget(
                          name: 'قواعد بيانات',
                          path:
                              'https://drive.google.com/drive/folders/1vD5HfNhJCUFs5zC9QZKMWcfRbfTnZO1H'),
                      nameWidget(
                          name: 'معالجة الاشارة الرقمية',
                          path:
                              'https://drive.google.com/drive/folders/1qbsBkVERS5TDT-q5ppbePL7H9tbyKo1x'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      nameWidget(
                          name: 'تحليلات هندسية',
                          path:
                              'https://drive.google.com/drive/folders/1q79m8hPZzl-zNiSSY-QcYFZozvhcAzCR'),
                      nameWidget(
                          name: 'اسس الشبكات',
                          path:
                              'https://drive.google.com/drive/folders/1xsQ3ZTS67a5-0dvsKU1cPdq9bG_slOs1'),
                      nameWidget(
                          name: 'زمن حقيقي',
                          path:
                              'https://drive.google.com/drive/folders/1c5ilRamcxO5WRBGOckrUH1OATacBOTJ6'),
                      nameWidget(
                          name: 'اسس التحكم والسيطرة ',
                          path:
                              'https://drive.google.com/drive/folders/16c-TdBEoYGRaQbgnSMODXm0NvV8RHJO'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
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
