import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MathLevelOne extends StatelessWidget {
  const MathLevelOne({Key? key}) : super(key: key);

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كتب رياضيات المرحلة الاولى'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Constant().myLaunchUrl(
                      'https://drive.google.com/drive/folders/1t--E_Cp5lKnHgs5RnZYYGh2WiAgFj6Hs?usp=sharing'),
                  child: Card(
                    color: Constant().classLibraryColor,
                    child: const SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(child: Text('math2')),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('الكترونيك رقمي '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text(' اسس الهندسة الكهربائية  '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('برمجة ١ '),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text(' الرسم الهندسي  '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('حقوق الانسان   '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('تركيب الحاسوب '),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('اللغة الانكليزية'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
