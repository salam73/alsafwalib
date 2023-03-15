import 'dart:convert';

import 'package:alsafwalib/model/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
//import 'package:alsafwalib/model/lib_model.dart' as lab;
import 'package:flutter/material.dart';
import 'package:notion_api/notion.dart';
import 'package:http/http.dart' as http;
/*import 'package:notion_api/notion/general/lists/pagination.dart';
import 'package:notion_api/notion/general/lists/properties.dart' as pr;
import 'package:notion_api/notion/general/property.dart' as per;
import 'package:notion_api/notion/general/rich_text.dart' as rt;
import 'package:notion_api/notion/general/types/notion_types.dart' as rtt;*/
import 'package:notion_api/notion_databases.dart';

import '../Constant/constant.dart';
import '../model/book_model.dart' as book;

class NotionApi extends StatefulWidget {
  @override
  State<NotionApi> createState() => _NotionApiState();
}

class _NotionApiState extends State<NotionApi> {
  final String myUrl = '82566198aca9482c87ff3e2bdb7f484c';
  String isLoading = 'loading';
  bool loadingData = false;
  String level = 'المرحله الاولى';

  Iterable iterableBooksList = [];

  NotionClient notion =
      NotionClient(token: 'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI');

  NotionDatabasesClient databases = NotionDatabasesClient(
      token: 'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI');

  Future<void> getData() async {
    try {
      var response = await databases.fetch('551c9eaa0dcb4e4e98a914dc4165e99e');
      //var data = response.database!.toJson();

      print(response.database);
    } catch (e) {
      print(e);
    }
  }

  getItems2() async {

    // List<Item> myItems = [];
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.notion.com/v1/databases/96aaa9ca8b5c4532abc2142883d3ebda/query'
          //  'https://api.notion.com/v1/databases/551c9eaa0dcb4e4e98a914dc4165e99e/query'
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI',
          'Notion-Version': '2022-06-28',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;

        var resultsData = data['results'];

        // List<dynamic> dynamicMyData =
        //     (resultsData).map((e) => Item.fromMap2(e)).toList();

        List<dynamic> dynamicMyData =
            (resultsData).map((e) => Item.fromMap2(e)).toList();

        iterableBooksList = dynamicMyData.map((e) => e);
        //  print(data['results']);
int numb=0;

final CollectionReference books=FirebaseFirestore.instance.collection('books');

        for (Item v in iterableBooksList.toList().reversed) {
          numb++;
         print(v.name);
         print('الاقسام :${v.category}');
         print('تسلسل: ${v.tasalsel}');
         print('الرف :${v.raf}');
         print('الرف :${v.image}');
         print('الرف :${v.available}');


         DatabaseReference ref = FirebaseDatabase.instance.ref("books");

        /* await ref.set({
           "name": v.name,
           "category": v.category,
           "sequence": v.tasalsel,
           "raf": v.raf,
           "image": v.image,
           "available": v.available,

         });*/
          books.add({
            "name":v.name,
            "الأقسام":v.category,
            "sequence": v.tasalsel,
            "raf": v.raf,
            "image": v.image,
            "available": v.available,
          });

        }

      }
      return iterableBooksList.where((element) => element.category == level);
    } catch (e) {

      print('error $e');
    }
    print('hello');
  }

  Future<Iterable> getItems(String level) async {
    // List<Item> myItems = [];
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.notion.com/v1/databases/078782aad3a9490a9e87fc7b0f105106/query'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI',
          //mohmad
          'Accept': '*/*',

          'Notion-Version': '2022-06-28',

          // 'start_cursor':'62db76af-b81c-4f83-800b-a19b77cf019a',
        },
        //body: "{$nextCursor}",
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;

        var resultsData = data['results'];

        // List<dynamic> dynamicMyData =
        //     (resultsData).map((e) => Item.fromMap2(e)).toList();

        List<dynamic> dynamicMyData =
            (resultsData).map((e) => book.Book.fromJson(e)).toList();

/**/

        iterableBooksList = dynamicMyData.map((e) => e);
        print(data['results']);
        print('f');
      }
      return iterableBooksList.where((element) => element.category == level);
    } catch (e) {
      print('error $e');
    }
    return [];
  }

  updateData(String pageId, bool available) async {
    print('please wait');

    var json = """{
      "properties": {
        "available": 
        {
          "checkbox": ${!available}},
              "personName": {
                "rich_text": 
                [
                  {
                    "type": "text",
                    "text": {"content": "${DateTime.now().toString()}"}
                  }
                ]
          }
      }
    }""";
    try {
      String url = 'https://api.notion.com/v1/pages/$pageId';
      await http
          .patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI',
          'Notion-Version': '2022-06-28',
        },
        body: json,
      )
          .then(
        (value) {
          //  print(value.body);
          print('done wait');
        },
      ).whenComplete(() => print('complete'));
      setState(() {
        //myItems=[];
        loadingData = false;
        // level = 'المرحلة الاولى';
      });
      ;
    } catch (e) {
      print(e);
    }
  }

  getDataRealTime(){
    DatabaseReference ref = FirebaseDatabase.instance.ref("books/تخدير");

    ref.onValue.listen((event) {


      Map book=event.snapshot.value as Map;

      if (kDebugMode) {
        print(book);
      }
      setState(() {

      });
    });

  }

  /* "id":"Fj%3F%5E",
  "rich_text": "text",
  "text": [{"type": "text", "text": { "content": "To Do"} }]*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level = 'المرحلة الرابعة';
    getItems2();
   // getDataRealTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api'),
      ),
      body: FutureBuilder<Iterable>(
        future: getItems(level),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Iterable myItems = snapshot.data!;

            return Column(
              children: [
                loadingData ? const Text('please wait') : Container(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    children: [
                      for (Item g in myItems)
                        InkWell(
                          onTap: () {
                            updateData(g.pageID, g.available);
                            print(g.pageID);
                            setState(() {
                              loadingData = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              color: g.available
                                  ? Constant().classLibraryColor
                                  : Colors.red,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(g.name),
                                    Text(g.available.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return (Text(isLoading));
          }
          //  return(const Text('loading'));
        },
      ),
    );
  }
}
