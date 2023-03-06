import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constant{
  static String notionToken='secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI';

  Color classLibraryColor=const Color(0XffD0f4de);
  Color mainClassColor=const Color(0Xffade8f4);
  Color researchBooksColor=const Color(0Xfff8edeb);


  Future<void> myLaunchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}