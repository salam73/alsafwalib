import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/general_widget.dart';

class ResearchList extends StatefulWidget {
  ResearchList({
    Key? key,
    required this.part,
  }) : super(key: key);
  final String part;

  @override
  State<ResearchList> createState() => _ResearchListState();
}

class _ResearchListState extends State<ResearchList> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _collage;
  String? _idNumber;
  String? _currentSelectedValue;

  Query<Map<String, dynamic>> getStream() {
    Query<Map<String, dynamic>> books = FirebaseFirestore.instance
        .collection('books')
        .where('الأقسام', isEqualTo: widget.part);

    Query<Map<String, dynamic>> books2 = FirebaseFirestore.instance
        .collection('books2')
        .where('الأقسام', isEqualTo: widget.part);


    return books2;
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GeneralWidget.MyAppBar(name: widget.part),
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
                stream: getStream().snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                            /* color: documentSnapshot['available']
                                ? const Color(0xffb0f0a1)
                                : const Color(0xfff7b19c),*/
                            child:
                            /*documentSnapshot['available']
                                ?
                            InkWell(
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
                                                    documentSnapshot['available'],
                                                    documentSnapshot['name']));
                                          });
                                    },
                                    child: Padding(
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
                                              */
                            /*  SizedBox(

                                            child: Text('القسم : ${documentSnapshot['الأقسام']}'),
                                          ),*/
                            /*
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
                                              loadingBuilder: (BuildContext context,
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
                                : */
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(

                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    //mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      Text(
                                          'الإسم      : ${documentSnapshot['name']}'),
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
                                  /*   Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
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
                                        ),*/
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


}
