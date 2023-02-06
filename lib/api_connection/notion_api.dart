import 'dart:convert';

import 'package:alsafwalib/model/lib_model.dart' as l;
import 'package:flutter/material.dart';
import 'package:notion_api/notion.dart';
import 'package:http/http.dart' as http;
import 'package:notion_api/notion/general/lists/pagination.dart';
import 'package:notion_api/notion/general/lists/properties.dart' as pr;
import 'package:notion_api/notion_databases.dart';

class NotionApi extends StatelessWidget {
  NotionApi({Key? key}) : super(key: key);

  NotionClient notion =
      NotionClient(token: 'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI');
  NotionDatabasesClient databases = NotionDatabasesClient(
      token: 'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI');

  getData() async {
    try {
      var response = await databases.fetch('551c9eaa0dcb4e4e98a914dc4165e99e');
      //  var data = response.database!.toJson();
      print(response);
    } catch (e) {
      print(e);
    }
  }

  getItems(/*{String curson = '', bool refresh=false}*/) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            'https://api.notion.com/v1/databases/551c9eaa0dcb4e4e98a914dc4165e99e/query'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': //karbalaToken, //karbala token
          'secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI', //mohmad

          'Notion-Version': '2022-06-28',
          // 'start_cursor':'62db76af-b81c-4f83-800b-a19b77cf019a',
          //  'Host': 'api.notion.com'
        },
        //body: "{$nextCursor}",
      );
      var data = (response.body)  ;
    data= data.replaceAll('\'', '');
      var g= jsonEncode(data)  ;
     // l.Lab myData =l.Lab.fromJson(data);
    print(g);

    // myData.results.map((e) => print(e.properties.name));
    } catch (e) {
      print('error $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('api'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: getItems,
          child: Text('get data'),
        ),
      ),
    );
  }
}
