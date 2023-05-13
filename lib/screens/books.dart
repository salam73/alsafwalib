import 'package:flutter/material.dart';

import '../Constant/constant.dart';
import '../Constant/general_widget.dart';
import 'books_list.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'كتب عامة'),
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
                    sectionName(context, 'هندسة'),
                    sectionName(context, 'قانون'),
                    sectionName(context, 'صيدلة'),
                    sectionName(context, 'تخدير'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    sectionName(context, 'تحليلات'),
                    sectionName(context, 'طب أسنان'),
                    sectionName(context, 'التربية الرياضية'),
                    sectionName(context, 'الادارة والاقتصاد'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sectionName(context, name) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BooksList(
                      deparmentName: name,
                    )));
      },
      child: Card(
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
