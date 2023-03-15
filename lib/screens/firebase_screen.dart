import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseScreen extends StatefulWidget {
  FirebaseScreen({
    Key? key,
    required this.part,
  }) : super(key: key);
  final String part;

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _collage;
  String? _idNumber;
  String? _currentSelectedValue;

  Query<Map<String, dynamic>> getStream() {
    Query<Map<String, dynamic>> books = FirebaseFirestore.instance
        .collection('books')
        .where('الأقسام', isEqualTo: widget.part);
    return books;
  }

  final _currencies = [
  'هندسة تقنيات الحاسوب',
  'هندسة تقنيات الاجهزة الطبية',
  'طب اسنان',
  'تقنيات تخدير',
  'الصيدلة',
  'تقنيات صناعة الاسنان',
  'قانون',
  'ادارة اعمال',
  'التربية الرياضية',
  'مختبرات طبية',
  'المحاسبة',
  'التمريض'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.part),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Center(
                  child: Container(
                child: Text('إستعارة الكتب'),
              )),
            ),
            StreamBuilder(
                stream: getStream().snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          //   print(documentSnapshot['image']);
                          return Card(
                              color: documentSnapshot['available']
                                  ? const Color(0xffb0f0a1)
                                  : const Color(0xfff7b19c),
                              child: /*!documentSnapshot['available']
                                  ?*/
                                  InkWell(
                                onTap: () async {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.1,
                                            child: formWidget(
                                                documentSnapshot.id,
                                                documentSnapshot['available'],
                                                documentSnapshot['name']));
                                      });

                                  // print('books/${documentSnapshot.id}');
                                  /*  final ref = FirebaseFirestore.instance
                                            .doc("books/${documentSnapshot.id}");
                                        try {
                                          await ref.update({
                                            "available":
                                                !documentSnapshot['available'],
                                          });
                                        } catch (e) {
                                          print(e);
                                        }*/
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: Text(documentSnapshot['name']),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: Text(documentSnapshot['الأقسام']),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      child: Text(documentSnapshot['sequence']
                                          .toString()),
                                    ),
                                    SizedBox(
                                        width: 10,
                                        child: Text(documentSnapshot['raf']
                                            .toString())),
                                    SizedBox(
                                        height: 100,
                                        child: Image.network(
                                          documentSnapshot['image'],
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
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
                              )

                              );
                        },
                      ),
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
                }),
          ],
        ),
      ),
    );
  }

  Widget formWidget(String id, bool available, String name) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(name),
                TextFormField(
                  decoration: InputDecoration(labelText: 'الإسم'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال الإسم';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
               /* TextFormField(
                  decoration: InputDecoration(labelText: 'الكلية'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال إسم الكلية';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _collage = value;
                  },
                ),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(

                           // labelStyle: TextStyle(color: Colors.greenAccent),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            labelText: 'إسم الكلية',
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
                  decoration: InputDecoration(labelText: 'رقم البطاقة'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال رقم البطاقة';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _idNumber = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // print(id);

                      final myDoc = FirebaseFirestore.instance.doc("books/$id");

                      print(myDoc.get());
                      try {
                        await myDoc.update({
                          "available": !available,
                        });

                        final ref = FirebaseFirestore.instance
                            .collection("books/$id/users")
                            .doc();

                        try {
                          await ref.set({
                            "name": _name,
                            "collage": _collage,
                            "idNumber": _idNumber,
                            "time": DateTime.now(),
                          });
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text('استعارة'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
