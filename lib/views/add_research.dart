import 'dart:html' as ht;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class AddResearch extends StatefulWidget {
  const AddResearch({Key? key}) : super(key: key);

  @override
  State<AddResearch> createState() => _AddResearchState();
}

class _AddResearchState extends State<AddResearch> {
  //final ref = FirebaseFirestore.instance.collection("books").doc();
  final research = FirebaseFirestore.instance.collection("books2").doc();
  final researchBook =
      FirebaseFirestore.instance.collection('books2').orderBy('الأقسام');

  PlatformFile? pickupFile;
  final _formKey = GlobalKey<FormState>();

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
  String done = '';

  final _currencies = [
    'إدارة أعمال',
    'التربية الرياضية',
    'تحليلات',
    'تخدير',
    'صيدلة',
    'طب أسنان',
    'قانون',
    'هندسة',
  ];

  uploadToFireBase() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await research.set({
          // 'available': true,
          "name": name,
          "الأقسام": _collage,
          "sequence": sequence,
          "raf": raf,
          // "image": imgUrl,
        });
        // Navigator.pop(context);
        setState(() {
          done = 'done';
        });
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Widget getUserName(BuildContext context,
      AsyncSnapshot<QuerySnapshot> streamSnapshot, String id) {
    final users = FirebaseFirestore.instance
        .collection('books/$id/users')
        .orderBy('time', descending: true);

    return StreamBuilder(
        stream: users.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Wrap(
                          children: [
                            Text('${documentSnapshot['name']} , '),
                            Text('${documentSnapshot['collage']} , '),
                            Text(documentSnapshot['idNumber'].toString()),
                            const Divider()
                          ],
                        );
                      }),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Clear'))
              ],
            );
          }
          return const Text('loading');
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff893422),
                  elevation: 0,
                  iconTheme: const IconThemeData(
                    color: Colors.white, //change your color here
                  ),
                  // leading: Image.asset('assets/safwa.jpg'),
                  title: const Text(
                    'رفع البحث',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [Image.asset('assets/safwa.jpg')],

                  bottom: const TabBar(
                    labelColor: Colors.white,
                    tabs: [
                      SizedBox(
                        height: 30,
                        child: Text('رفع البحث'),
                      ),
                      SizedBox(
                        height: 30,
                        child: Text('قائمة البحوث'),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [uploadBook(), researchBookList()],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  uploadBook() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'إسم الكتاب'),
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
                          errorStyle: const TextStyle(
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
                          validator: (value) =>
                              value == null ? 'اختر اسم الكلية' : null,
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
                decoration: const InputDecoration(labelText: 'رقم التسلسل'),
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
                decoration: const InputDecoration(labelText: 'رقم الرف'),
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
                child: const Text('خزن الكتاب'),
                onPressed: uploadToFireBase,
              ),
              Text(done)
            ],
          ),
        ),
      ),
    );
  }

  researchBookList() {
    return StreamBuilder(
        stream: researchBook.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                //   print(documentSnapshot['image']);

                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    /*  subtitle:
                        getUserName(context, streamSnapshot, documentSnapshot.id),*/
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                             // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.end,

                                  children: [
                                    Text(
                                        'الإسم      : ${documentSnapshot['name']}'),
                                    SizedBox(
                                        child: Text(
                                            'القسم      : ${documentSnapshot['الأقسام'].toString()}')),
                                    SizedBox(
                                        child: Text(
                                            'التسلسل : ${documentSnapshot['sequence'].toString()}')),
                                    SizedBox(
                                        child: Text(
                                            'الرف       : ${documentSnapshot['raf'].toString()}')),
                                         //   Text(documentSnapshot.id)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: ()  {
                          showAlertDialog(context,"books2/${documentSnapshot.id}",documentSnapshot['name']);
                         /* final myDoc = FirebaseFirestore.instance
                              .doc("books2/${documentSnapshot.id}");

                          try {
                            await myDoc.delete();
                          } catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                          }*/
                        },
                        child: const Text('مسح البحث'),
                      ),
                      // getUserName(context, streamSnapshot, documentSnapshot.id),
                      //Text('asd')
                    ],
                  ),
                );
              },
            );
          }
          return Center(
            child: Column(
              children: const [
                CircularProgressIndicator(),
                Text('please wait ...')
              ],
            ),
          );
        });
  }
  showAlertDialog(BuildContext context, String docId, String bookName) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("إلغاء"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("مسح"),
      onPressed:  () async{
        Navigator.pop(context);
        final myDoc = FirebaseFirestore.instance
            .doc(docId);

        try {
          await myDoc.delete();

        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }

      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("مسح البحث"),
      content: Text("هل تريد مسح البحث $bookName"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
