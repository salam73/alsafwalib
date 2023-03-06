class Item {
  final String name;
  final String category;
  final String pageID;
  final bool available;
  final String image;
  final int raf;
  final int tasalsel;
  /*final String category;
  final int price;
  final DateTime date;
  final List pic;
  final String pdf;
  final String dic;
  final String area;
  final String pageid;*/

  const Item({
    required this.name,
    required this.category,
    required this.available,
    required this.pageID,
    required this.image,
    required this.raf,
    required this.tasalsel,
   /* required this.category,
    required this.price,
    required this.date,
    required this.pic,
    required this.pdf,
    required this.dic,
    required this.area,
    required this.pageid,*/
  });

  //this is for karbala project
 /* factory Item.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final nameList = (properties['myname']?['title'] ?? []) as List;
    final dic = (properties['discerption']?['title'] ?? []);
    final picList = (properties['pic']?['files'] ?? []);
    final pdfList = (properties['pdf']?['files'] ?? []) as List;
    final dateStr = properties['Date']?['date']?['start'];
    return Item(
      name: nameList.isNotEmpty ? nameList[0]['plain_text'] : '?',
      dic: dic.isNotEmpty ? dic[0]['plain_text'] : '?',
      category: properties['category']?['select']?['name'] ?? '',
      area: properties['area']?['select']?['name'] ?? '',
      pic: picList.isNotEmpty
          ? picList
          : [
              'https://i.pinimg.com/originals/99/29/4a/99294a1f9c7e060973ee95fdb2a667b7.jpg'
            ],
      pdf: pdfList.isNotEmpty ? pdfList[0]['external']['url'] : '',
      price: (properties['Price']?['number'] ?? 0),
      date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
    );
  }*/

  //this is for mohmmad project
  factory Item.fromMap2(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final pageId = map['id'] as String;
    final name = (properties['Name']?['title'] ?? []);
    final raf = (properties['الرف']?['number'] ?? 0);
    final tasalsel = (properties['التسلسل']?['number'] ?? 0);

    final image = (properties['صورة']?['files'] ?? []);

  /*  final dic = (properties['discerption']?['rich_text'] ?? []);
    final pageid = (properties['pageid']?['rich_text'] ?? []);
    final picList = (properties['pic']?['files'] ?? []);
    final pdfList = (properties['pdf']?['files'] ?? []);
    final dateStr = properties['Date']?['date']?['start'];*/
    return Item(

      name: name.isNotEmpty ? name[0]['plain_text'] : '',
      category: properties['الاقسام']?['select']?['name'] ?? '',
      available: properties['مستعار']?['checkbox'] ?? false,
      raf: raf,
      tasalsel: tasalsel,
     pageID: pageId,
      image: image.isNotEmpty? image[0]['file']['url']:'',

     /* dic: dic.isNotEmpty ? dic[0]['plain_text'] : '?',
      pageid: pageid.isNotEmpty ? pageid[0]['plain_text'] : '',
      category: properties['category']?['select']?['name'] ?? '',
      area: properties['area']?['select']?['name'] ?? '',
      pic: picList.isNotEmpty ? picList : [],
      pdf: pdfList.isNotEmpty ? pdfList[0]['external']['url'] : '',
      price: (properties['Price']?['number'] ?? 1),
      date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),*/
    );
  }
}
