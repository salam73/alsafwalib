import 'dart:html' as ht;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class AddBooks extends StatefulWidget {
  const AddBooks({Key? key}) : super(key: key);

  @override
  State<AddBooks> createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  final ref = FirebaseFirestore.instance.collection("books").doc();
  final books =
      FirebaseFirestore.instance.collection('books').orderBy('الأقسام');

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
        //print(downloadUrl);
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }

  uploadToFireBase() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await ref.set({
          'available': true,
          "name": name,
          "الأقسام": _collage,
          "sequence": sequence,
          "raf": raf,
          "image": imgUrl,
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

  Widget getUserName(
    BuildContext context,
    AsyncSnapshot<QuerySnapshot> streamSnapshot,
    String id,
  ) {
    final users = FirebaseFirestore.instance
        .collection('books/$id/users')
        .orderBy('time', descending: true);

    return StreamBuilder(
        stream: users.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return SizedBox(
              height: 40,
              child: ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Row(
                      children: [
                        Text('${documentSnapshot['name']} , '),
                        Text(documentSnapshot['collage']),
                        // Text(documentSnapshot['time'].toString()),
                      ],
                    );
                  }),
            );
          }
          return const Text('loading');
        });
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
      if (kDebugMode) {
        print(imageUrl);
      }
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
                  title: const Text('رفع الكتاب'),
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.book)),
                      Tab(icon: Icon(Icons.label_important)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [uploadBook(), booksList()],
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
              imgUrl == null
                  ? const Placeholder(
                      fallbackHeight: 200,
                      fallbackWidth: 400,
                    )
                  : SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.network(
                        imgUrl!,
                        fit: BoxFit.contain,
                      ),
                    ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () => uploadToStorage(),
                child: const Text("Upload"),
              ),
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

  booksList() {
    return StreamBuilder(
        stream: books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                //   print(documentSnapshot['image']);
                return ExpansionTile(
                  title: Card(
                    elevation: 3,
                    color: documentSnapshot['available']
                        ? const Color(0xffb0f0a1)
                        : const Color(0xfff7b19c),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              SizedBox(
                                width: 250,
                                child:
                                    Text('الإسم : ${documentSnapshot['name']}'),
                              ),
                              SizedBox(
                                  child: Text(
                                      'التسلسل : ${documentSnapshot['sequence'].toString()}')),
                              SizedBox(
                                  child: Text(
                                      'الرف       : ${documentSnapshot['raf'].toString()}')),
                              Text(documentSnapshot.id)
                            ],
                          ),
                          SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.network(
                                documentSnapshot['image'],
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  subtitle:
                      getUserName(context, streamSnapshot, documentSnapshot.id),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final myDoc = FirebaseFirestore.instance
                                .doc("books/${documentSnapshot.id}");

                            try {
                              await myDoc.update({
                                "available": !documentSnapshot['available'],
                              });
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
                          },
                          child: const Text('update'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final myDoc = FirebaseFirestore.instance
                                .doc("books/${documentSnapshot.id}");

                            try {
                              await myDoc.delete();
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
                          },
                          child: const Text('delete'),
                        ),
                      ],
                    ),
                    // getUserName(context, streamSnapshot, documentSnapshot.id),
                    //Text('asd')
                  ],
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
}
