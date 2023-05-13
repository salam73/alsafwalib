import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
import '../../Constant/general_widget.dart';

class BooksLevelFour extends StatelessWidget {
  const BooksLevelFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: GeneralWidget.MyAppBar(name: 'المرحلة الرابعة'),
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
                          name: ' وسائط متعددة',
                          path:
                              'https://drive.google.com/drive/folders/1WZfu4VqKkKZ34Wfk2FJxqltGVWtJqCvk?usp=sharing'),
                      nameWidget(
                          name: 'امنبة الحاسوب',
                          path:
                              'https://drive.google.com/drive/folders/11iSMuc7Gn6eh1Q4N7MsrgVvvvsdrDG7u?usp=sharing'),
                      nameWidget(
                          name: ' ادارة مشاريع',
                          path:
                              'https://drive.google.com/drive/folders/13CJko2YTFioKApN-t4te4aZzEUcoSHaR?usp=sharing'),
                      nameWidget(
                          name: 'الالياف الضوئية',
                          path:
                              'https://drive.google.com/drive/folders/1t--E_Cp5lKnHgs5RnZYYGh2WiAgFj6Hs?usp=sharing'),
                      /* nameWidget(name: '', path: ''),
                  nameWidget(name: '', path: ''),
                  nameWidget(name: '', path: ''),*/
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      nameWidget(
                          name: 'اتصالات متنقلة',
                          path:
                              'https://drive.google.com/drive/folders/1vh61P-SkZWybSe38J3vv2ed6FHf6MZ_-'),
                      nameWidget(
                          name: 'نظرية المعلومات',
                          path:
                              'https://drive.google.com/drive/folders/1FNBWnytSvAJ_XeGRaTm1H3GEjLgY9LYW'),
                      nameWidget(
                          name: 'بروتكولات عامة',
                          path:
                              'https://drive.google.com/drive/folders/10FaAOMJqjDf2c5cHSCulb8fr8OPMg5JG'),
                      nameWidget(
                          name: 'English',
                          path:
                              'https://drive.google.com/drive/folders/1maZbPzSRo3mR7a83Jvquw5CAvdHSHvQc'),
                      // nameWidget(name: '', path: ''),
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
