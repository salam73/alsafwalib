import 'package:alsafwalib/screens/books.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/general_widget.dart';
import 'main_page.dart';

class BooksList extends StatefulWidget {
  BooksList({
    Key? key,
    required this.deparmentName,
  }) : super(key: key);
  final String deparmentName;

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _collage;
  String? _idNumber;

  Query<Map<String, dynamic>> getBooksByDepartment() {
    Query<Map<String, dynamic>> books = FirebaseFirestore.instance
        .collection('books')
        .where('الأقسام', isEqualTo: widget.deparmentName);

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: widget.deparmentName),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: StreamBuilder(
                stream: getBooksByDepartment().snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        //   print(documentSnapshot['image']);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 3,
                            color: documentSnapshot['available']
                                ? const Color(0xffdec99e)
                                : const Color(0xfff7b19c),
                            child: documentSnapshot['available']
                                ? InkWell(
                                    onTap: () async {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.2,
                                                child: formWidget(
                                                    documentSnapshot.id,
                                                    documentSnapshot[
                                                        'available'],
                                                    documentSnapshot['name']));
                                          });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Wrap(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.end,

                                            children: [
                                              SizedBox(
                                                width: 250,
                                                child: Text(
                                                    'الإسم      : ${documentSnapshot['name']}'),
                                              ),
                                              /*  SizedBox(

                                            child: Text('القسم : ${documentSnapshot['الأقسام']}'),
                                          ),*/
                                              SizedBox(
                                                  child: Text(
                                                      'التسلسل : ${documentSnapshot['sequence'].toString()}')),
                                              SizedBox(
                                                  child: Text(
                                                      'الرف       : ${documentSnapshot['raf'].toString()}'))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: Image.network(
                                              documentSnapshot['image'],
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //mainAxisAlignment: MainAxisAlignment.end,

                                          children: [
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                  'الإسم : ${documentSnapshot['name']}'),
                                            ),
                                            /*  SizedBox(

                                            child: Text('القسم : ${documentSnapshot['الأقسام']}'),
                                          ),*/
                                            SizedBox(
                                                child: Text(
                                                    'التسلسل : ${documentSnapshot['sequence'].toString()}')),
                                            SizedBox(
                                                child: Text(
                                                    'الرف       : ${documentSnapshot['raf'].toString()}'))
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: SizedBox(
                                              height: 150,
                                              width: 150,
                                              child: Image.network(
                                                documentSnapshot['image'],
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
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
                                        ),
                                      ],
                                    ),
                                  ),
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
                }),
          ),
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
                Text('إستعارة الكتاب : $name'),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'الإسم'),
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
                            errorStyle: const TextStyle(
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
                  decoration: const InputDecoration(labelText: 'رقم البطاقة'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // print(id);

                          final myDoc =
                              FirebaseFirestore.instance.doc("books/$id");

                          // print(myDoc.get());
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
                              // ignore: use_build_context_synchronously

                              Get.dialog(
                                AlertDialog(
                                  title: Text('الاستعارة'),
                                  content: Text(
                                      'تمت الاستعار, الرجاء الحظور للمكتبه'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage()),
                                        );
                                        // Get.to(() => MainPage());
                                      },
                                      child: Text('إغلاق'),
                                    ),
                                  ],
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: const Text('استعارة'),
                    ),
                    ElevatedButton(
                        onPressed: () => Get.back(), child: Text('إغلاق'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
