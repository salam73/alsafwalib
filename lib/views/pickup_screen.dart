import 'dart:html' as ht;
import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PickUpScreen extends StatefulWidget {
  const PickUpScreen({Key? key}) : super(key: key);

  @override
  State<PickUpScreen> createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  PlatformFile? pickupFile;
  final _formKey = GlobalKey<FormState>();

  Future selectFile() async {}
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseStorage fs = FirebaseStorage.instance;
  ht.FileUploadInputElement uploadInput = ht.FileUploadInputElement()
    ..accept = 'image/*';
  String? imgUrl;

  String? name;
  String? part;
  String? sequence;
  String? _collage;
  String? raf;
  String done='';


  final _currencies = [
    'الادارة والاقتصاد',
    'التربية الرياضية',
    'تحليلات',
    'تخدير',
    'صيدلة',
    'طب أسنان',
    'قانون',
    'هندسة',
  ];


  uploadToStorage() {
    final input = ht.FileUploadInputElement()..accept = 'image/*';

    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = ht.FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot2 =
            await fs.ref().child('images/${file.name}').putString(file.name);
        var snapshot =
            await fs.ref().child('images/${file.name}').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print(downloadUrl);
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }

  uploadToFireBase()async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final ref = FirebaseFirestore.instance.collection("books").doc();

      try {
        await ref.set({
          'available':true,
          "name": name,
          "الأقسام": _collage,
          "sequence": sequence,
          "raf": raf,
          "image": imgUrl,
        });
       // Navigator.pop(context);
        setState(() {
          done='done';
        });
      } catch (e) {
        print(e);
      }
    }
  }
  uploadImage() {
    uploadInput.click();

    final input = ht.FileUploadInputElement()..accept = 'image/*';
    uploadInput.onChange.listen((e) async {
      final file = input.files!.first;

      String fileName = file.name;
      var snapshot =
          await fs.ref().child('images/$fileName').putString(fileName);

      String imageUrl = await snapshot.ref.getDownloadURL();
      print(imageUrl);
      setState(() {
        imgUrl = imageUrl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      imgUrl == null
                          ? Placeholder(
                              fallbackHeight: 200,
                              fallbackWidth: 400,
                            )
                          : Container(
                              height: 300,
                              width: 300,
                              child: Image.network(
                                imgUrl!,
                                fit: BoxFit.contain,
                              ),
                            ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () => uploadToStorage(),
                        child: Text("Upload"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'إسم الكتاب'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال الإسم';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value;
                        },
                      ),
                     

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(

                                // labelStyle: TextStyle(color: Colors.greenAccent),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  labelText: 'إسم القسم',
                                  // helperText: 'اسم الكلية',


                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                              isEmpty: _collage == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  value: _collage,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    _collage = newValue;
                                    state.didChange(newValue);
                                  },
                                  validator: (value) => value == null ? 'اختر اسم الكلية' : null,
                                  items: _currencies.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'رقم التسلسل'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال رقم التسلسل';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          sequence = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'رقم الرف'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال رقم الرقم';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          raf = value;
                        },
                      ),
                      ElevatedButton(
                        child: Text('خزن الكتاب'),
                        onPressed: uploadToFireBase,
                      ),

                      Text(done)
                    ],
                  ),
                ),
              ),
            )),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
