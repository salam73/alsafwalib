import 'package:flutter/material.dart';
import 'package:alsafwalib/screens/admin_page.dart';
import 'package:alsafwalib/screens/main_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('المكتبة الإلكترونيه'),
        ),
        body: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminPage()));
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
        ));
  }
}
