import 'package:alsafwalib/Constant/constant.dart';
import 'package:alsafwalib/screens/research_list.dart';
import 'package:flutter/material.dart';

import '../Constant/general_widget.dart';

class Research extends StatelessWidget {
  const Research({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'بحوث التخرج'),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /*'إدارة أعمال',
              'التربية الرياضية',
              'تحليلات',
              'تخدير',
              'صيدلة',
              'طب أسنان',
              'قانون',
              'هندسة',*/

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 myCard('صيدلة', context),
                 myCard('طب أسنان', context),
                 myCard('قانون', context),
                 myCard('إدارة أعمال', context),

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  myCard('هندسة', context),
                  myCard('تحليلات', context),
                  myCard('التربية الرياضية', context),
                  myCard('تخدير', context),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget myCard(String name, BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.push(
            context,MaterialPageRoute(builder: (context)=> ResearchList(part: name,))
        );
      },
      child: Card(
        color: Constant().researchBooksColor,
        child:  SizedBox(
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
