import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('AdminPage'),),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              onChanged: (value){
                setState(() {
                  user=value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }

                return null;
              },
            ),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (value){
                setState(() {
                  password=value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';

                }


                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if(password=='1234') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddBooks()));
                  }
                  }

              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
