import 'package:flutter/material.dart';

import '../../Constant/constant.dart';

class BooksLevelFour extends StatelessWidget {
  const  BooksLevelFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('كتب المرحله الرابعة'),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [
                InkWell(
                  onTap: () => Constant().myLaunchUrl(
                      'https://drive.google.com/drive/folders/1WZfu4VqKkKZ34Wfk2FJxqltGVWtJqCvk?usp=sharing'),

                  child: Card(
                    color: Constant().classLibraryColor,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(child: Text('Multimedia Computing')),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Constant().myLaunchUrl(
                      'https://drive.google.com/drive/folders/11iSMuc7Gn6eh1Q4N7MsrgVvvvsdrDG7u?usp=sharing'),

                  child: Card(
                    color: Constant().classLibraryColor,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(
                        child: Text('Security of Computer and Network'),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Constant().myLaunchUrl(
                      'https://drive.google.com/drive/folders/13CJko2YTFioKApN-t4te4aZzEUcoSHaR?usp=sharing'),

                  child: Card(
                    color: Constant().classLibraryColor,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(
                        child: Text('Project Management'),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Constant().myLaunchUrl(
                      'https://drive.google.com/drive/folders/1t--E_Cp5lKnHgs5RnZYYGh2WiAgFj6Hs?usp=sharing'),

                  child: Card(
                    color: Constant().classLibraryColor,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Center(
                        child: Text('Optical Fiber'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  [
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('mobile comunication'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('Information Theory'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('network protocol'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().classLibraryColor,
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('English'),
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
