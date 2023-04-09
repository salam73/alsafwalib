import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/admin_page.dart';
import 'package:alsafwalib/screens/main_page.dart';
import 'package:get/get.dart';

import '../Constant/general_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: GeneralWidget.MyAppBar(name: 'المكتبة الإلكترونية'),
          body: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                  Get.to(const MainPage());
                  },
                  child: const Card(
                    elevation: 5,
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: Center(
                        child: Text('Enter as User'),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                   Get.to(const AdminPage());
                  },
                  child: const Card(
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: Center(
                        child: Text('Enter as Admin'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
