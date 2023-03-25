import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePge extends StatelessWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: ElevatedButton(
          child: const Text('run'),
          onPressed: () async {
            final ref = FirebaseFirestore.instance.collection("books").doc();

            try {
              await ref.set({
                "name": '_name',
                "collage": '_collage',
                "idNumber": '_idNumber',
              });
              if (kDebugMode) {
                print('done');
              }
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          },
        ),
      )),
    );
  }
}
