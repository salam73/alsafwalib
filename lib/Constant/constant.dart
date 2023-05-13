import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constant {
  //static String notionToken='secret_88gGWGqUtnkmrL3Ed6PkRqVl8Szo3ARGZt0q7AmO5CI';

  Color classLibraryColor = Color(0xffdec99e);
  Color mainClassColor = Color(0xffa69471);
  Color researchBooksColor = Color(0xffb69d6c);

  Future<void> myLaunchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
