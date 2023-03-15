import 'package:alsafwalib/views/pickup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                else{
                  user=value;
                }
                return null;
              },
            ),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';

                }

                else{
                  password=value;
                  print('access denied');
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PickUpScreen()));
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
