import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
import '../../Constant/general_widget.dart';

class BooksLevelTwo extends StatelessWidget {
  const BooksLevelTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'المرحلة الثانية'),


      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [
                nameWidget(name:'اتصالات' , path:'https://drive.google.com/drive/folders/1HcYJLFFz4DerKlSOzNAinTHwTi5CUVLj'),
                nameWidget(name:'اجهزة وقياسات' , path:'https://drive.google.com/drive/folders/1X0NsG7bqhuAKDsvvvmKWMSSFvjmtrMph'),
                nameWidget(name:'الكترونيك' , path:'https://drive.google.com/drive/folders/16ZHP1JJqf4_fWgRT3s4cCJcpDv-oMYjg'),
                nameWidget(name:'اللغة الانكليزية' , path:'https://drive.google.com/drive/folders/1FWEqvEd8QOim1a7Rp1hSFXEBhIKjWXez'),


                /*
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
                */
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [

                nameWidget(name:'برمجة ' , path:'https://drive.google.com/drive/folders/1htbHH8HdgLJe4W_clRCeUPmvt0SH3FUr'),
                nameWidget(name:'تطبيقات الحاسوب' , path:'https://drive.google.com/drive/folders/1Fgby0RR-RMiI6IAA91Yk1T9x-HUsPcuz'),
                nameWidget(name:'رياضيات' , path:'https://drive.google.com/drive/folders/1RoTJMwtqhK-tJK6s8zGOEb4uKaHGYHQd'),
                nameWidget(name:'معالجات' , path:'https://drive.google.com/drive/folders/1slxjhU1qqOt_QBTwVeOsJIkFtoJXBp2i'),
              /*
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
                */
              ],
            ),
          ],
        ),
      ),),
    );
  }
  nameWidget({String? name,String? path}){
    return InkWell(
      onTap: () => Constant().myLaunchUrl(
          path!),

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
