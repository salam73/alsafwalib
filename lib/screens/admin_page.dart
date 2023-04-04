import 'package:alsafwalib/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constant/general_widget.dart';
import '../views/add_books.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  String? user;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: 'Admin page'),
        body: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Card(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Username'),
                      onChanged: (value) {
                        setState(() {
                          user = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a username';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }

                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (password == '1234') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePge()));
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
