import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constant{
  static String notionToken='secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI';

  Color classLibraryColor=Color(0XffD0f4de);
  Color mainClassColor=Color(0Xffade8f4);
  Color researchBooksColor=Color(0Xfff8edeb);


  Future<void> myLaunchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}