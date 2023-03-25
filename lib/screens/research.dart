import 'package:alsafwalib/Constant/constant.dart';
import 'package:flutter/material.dart';

class Research extends StatelessWidget {
  const Research({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بحوث التخرج'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('الصيدلة'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('طب أسنان'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('قانون'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('إدارة أعمال'),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('هندسة حاسبات'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('تحليلات مرضية'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('رياضة'),
                    ),
                  ),
                ),
                Card(
                  color: Constant().researchBooksColor,
                  child: const SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                      child: Text('تمريض'),
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
