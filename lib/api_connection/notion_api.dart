import 'dart:convert';

import 'package:alsafwalib/model/item_model.dart';
import 'package:alsafwalib/model/lib_model.dart' as lab;
import 'package:flutter/material.dart';
import 'package:notion_api/notion.dart';
import 'package:http/http.dart' as http;
import 'package:notion_api/notion/general/lists/pagination.dart';
import 'package:notion_api/notion/general/lists/properties.dart' as pr;
import 'package:notion_api/notion/general/property.dart' as per;
import 'package:notion_api/notion/general/rich_text.dart' as rt;
import 'package:notion_api/notion/general/types/notion_types.dart' as rtt;
import 'package:notion_api/notion_databases.dart';

import '../Constant/constant.dart';

class NotionApi extends StatefulWidget {
  @override
  State<NotionApi> createState() => _NotionApiState();
}

class _NotionApiState extends State<NotionApi> {
  final String myUrl = '82566198aca9482c87ff3e2bdb7f484c';
  String isLoading = 'loading';
  String level = 'المرحله الاولى';

  Iterable iterableBooksList = [];

  NotionClient notion =
      NotionClient(token: 'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI');

  NotionDatabasesClient databases = NotionDatabasesClient(
      token: 'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI');

  getData() async {
    try {
      var response = await databases.fetch('551c9eaa0dcb4e4e98a914dc4165e99e');
      var data = response.database!.toJson();
      print(data);
    } catch (e) {
      print(e);
    }
  }

  Future<Iterable> getItems(String level) async {
    // List<Item> myItems = [];
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.notion.com/v1/databases/551c9eaa0dcb4e4e98a914dc4165e99e/query'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI',
          //mohmad

          'Notion-Version': '2022-06-28',
          // 'start_cursor':'62db76af-b81c-4f83-800b-a19b77cf019a',
          'Host': 'api.notion.com'
        },
        //body: "{$nextCursor}",
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;

        var resultsData = data['results'];

        List<dynamic> dynamicMyData =
            (resultsData).map((e) => Item.fromMap2(e)).toList();

        iterableBooksList = dynamicMyData.map((e) => e);
      }
      return iterableBooksList.where((element) => element.category == level);
    } catch (e) {
      print('error $e');
    }
    return [];
  }

  updateData(String pageId) async {
    try {
      await notion.pages.update(pageId,
          properties: pr.Properties(
            map: {
              'test': per.RichTextProp(
               content: [
                rt.Text('aslam')
               ]
              )

            },
          ));

      print('update');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level = 'المرحلة الاولى';
    //getItems();
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

            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              children: [
                for (Item g in myItems)
                  InkWell(
                    onTap: () {
                      updateData(g.pageID);
                      // getItems( 'المرحلة الثانية');
                      setState(() {
                        //myItems=[];
                        level = 'المرحلة الاولى';
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        color: g.available
                            ? Constant().classLibraryColor
                            : Colors.red,
                        child: Center(
                          child: Text(g.test),
                        ),
                      ),
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
