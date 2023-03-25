import 'package:flutter/material.dart';

class MathBooks extends StatefulWidget {
  MathBooks({Key? key}) : super(key: key);

  @override
  State<MathBooks> createState() => _MathBooksState();
}

class _MathBooksState extends State<MathBooks> {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كتب رياضيات'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'اللون الاحمر يدل على أن الكتاب مستعار',
              style: TextStyle(fontSize: 20),
            ),
            InkWell(
              onTap: () {
                if (color1 == Colors.white) {
                  setState(() {
                    color1 = Colors.red;
                  });
                }
              },
              child: Card(
                color: color1,
                child: const SizedBox(
                  width: 150,
                  height: 60,
                  child: Center(
                    child: Text('المعادلات التفاضلية'),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (color2 == Colors.white) {
                  setState(() {
                    color2 = Colors.red;
                  });
                }
              },
              child: Card(
                color: color2,
                child: const SizedBox(
                  width: 150,
                  height: 60,
                  child: Center(
                    child: Text('التفاضل'),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (color3 == Colors.white) {
                  setState(() {
                    color3 = Colors.red;
                  });
                }
              },
              child: Card(
                color: color3,
                child: const SizedBox(
                  width: 150,
                  height: 60,
                  child: Center(
                    child: Text('التكامل'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
