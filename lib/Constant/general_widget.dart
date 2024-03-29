import 'package:flutter/material.dart';

class GeneralWidget {

 static PreferredSizeWidget MyAppBar({required String name}){
    return AppBar(
      backgroundColor: const Color(0xff893422),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
     // leading: Image.asset('assets/safwa.jpg'),
      title:  Text(name, style: const TextStyle(color: Colors.white),),
      actions: [
        Image.asset('assets/safwa.jpg')
      ],
    );
  }
}