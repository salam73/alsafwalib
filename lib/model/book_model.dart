// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    required this.object,
    required this.results,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  final String object;
  final List<Result> results;
  final dynamic nextCursor;
  final bool hasMore;
  final ObjectEnum type;
  final Page page;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    object: json["object"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    nextCursor: json["next_cursor"],
    hasMore: json["has_more"],
    type: objectEnumValues.map[json["type"]]!,
    page: Page.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "next_cursor": nextCursor,
    "has_more": hasMore,
    "type": objectEnumValues.reverse[type],
    "page": page.toJson(),
  };
}

class Page {
  Page();

  factory Page.fromJson(Map<String, dynamic> json) => Page(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Result {
  Result({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.cover,
    required this.icon,
    required this.parent,
    required this.archived,
    required this.properties,
    required this.url,
  });

  final ObjectEnum object;
  final String id;
  final DateTime createdTime;
  final DateTime lastEditedTime;
  final TedBy createdBy;
  final TedBy lastEditedBy;
  final dynamic cover;
  final dynamic icon;
  final Parent parent;
  final bool archived;
  final Properties properties;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    object: objectEnumValues.map[json["object"]]!,
    id: json["id"],
    createdTime: DateTime.parse(json["created_time"]),
    lastEditedTime: DateTime.parse(json["last_edited_time"]),
    createdBy: TedBy.fromJson(json["created_by"]),
    lastEditedBy: TedBy.fromJson(json["last_edited_by"]),
    cover: json["cover"],
    icon: json["icon"],
    parent: Parent.fromJson(json["parent"]),
    archived: json["archived"],
    properties: Properties.fromJson(json["properties"]),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "object": objectEnumValues.reverse[object],
    "id": id,
    "created_time": createdTime.toIso8601String(),
    "last_edited_time": lastEditedTime.toIso8601String(),
    "created_by": createdBy.toJson(),
    "last_edited_by": lastEditedBy.toJson(),
    "cover": cover,
    "icon": icon,
    "parent": parent.toJson(),
    "archived": archived,
    "properties": properties.toJson(),
    "url": url,
  };
}

class TedBy {
  TedBy({
    required this.object,
    required this.id,
  });

  final Object object;
  final String id;

  factory TedBy.fromJson(Map<String, dynamic> json) => TedBy(
    object: objectValues.map[json["object"]]!,
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "object": objectValues.reverse[object],
    "id": id,
  };
}

enum Object { USER }

final objectValues = EnumValues({
  "user": Object.USER
});

enum ObjectEnum { PAGE }

final objectEnumValues = EnumValues({
  "page": ObjectEnum.PAGE
});

class Parent {
  Parent({
    required this.type,
    required this.databaseId,
  });

  final ParentType type;
  final String databaseId;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    type: parentTypeValues.map[json["type"]]!,
    databaseId: json["database_id"],
  );

  Map<String, dynamic> toJson() => {
    "type": parentTypeValues.reverse[type],
    "database_id": databaseId,
  };
}

enum ParentType { DATABASE_ID }

final parentTypeValues = EnumValues({
  "database_id": ParentType.DATABASE_ID
});

class Properties {
  Properties({
    required this.empty,
    required this.properties,
    required this.indecent,
    required this.sticky,
    required this.fluffy,
    required this.tentacled,
    required this.purple,
    required this.indigo,
    required this.name,
  });

  final Empty empty;
  final Class properties;
  final Fluffy indecent;
  final PropertiesClass sticky;
  final PropertiesClass fluffy;
  final Empty tentacled;
  final PropertiesClass purple;
  final Purple indigo;
  final Name name;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    empty: Empty.fromJson(json["اسم المستعير"]),
    properties: Class.fromJson(json["الاقسام"]),
    indecent: Fluffy.fromJson(json["مستعار"]),
    sticky: PropertiesClass.fromJson(json["رقم الهوية"]),
    fluffy: PropertiesClass.fromJson(json["الرف"]),
    tentacled: Empty.fromJson(json["الكلية"]),
    purple: PropertiesClass.fromJson(json["التسلسل"]),
    indigo: Purple.fromJson(json["صورة"]),
    name: Name.fromJson(json["Name"]),
  );

  Map<String, dynamic> toJson() => {
    "اسم المستعير": empty.toJson(),
    "الاقسام": properties.toJson(),
    "مستعار": indecent.toJson(),
    "رقم الهوية": sticky.toJson(),
    "الرف": fluffy.toJson(),
    "الكلية": tentacled.toJson(),
    "التسلسل": purple.toJson(),
    "صورة": indigo.toJson(),
    "Name": name.toJson(),
  };
}

class Empty {
  Empty({
    required this.id,
    required this.type,
    required this.richText,
  });

  final Id id;
  final Type type;
  final List<dynamic> richText;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    id: idValues.map[json["id"]]!,
    type: typeValues.map[json["type"]]!,
    richText: List<dynamic>.from(json["rich_text"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "type": typeValues.reverse[type],
    "rich_text": List<dynamic>.from(richText.map((x) => x)),
  };
}

enum Id { F_7_B_LJ, THE_5_ER_3_EE }

final idValues = EnumValues({
  "F%7BLj": Id.F_7_B_LJ,
  "%5ER%3Ee": Id.THE_5_ER_3_EE
});

enum Type { RICH_TEXT }

final typeValues = EnumValues({
  "rich_text": Type.RICH_TEXT
});

class PropertiesClass {
  PropertiesClass({
    required this.id,
    required this.type,
    required this.number,
  });

  final PurpleId id;
  final PurpleType type;
  final int number;

  factory PropertiesClass.fromJson(Map<String, dynamic> json) => PropertiesClass(
    id: purpleIdValues.map[json["id"]]!,
    type: purpleTypeValues.map[json["type"]]!,
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "id": purpleIdValues.reverse[id],
    "type": purpleTypeValues.reverse[type],
    "number": number,
  };
}

enum PurpleId { R_ZO_5_E, Q_7_CDT, QWM_L }

final purpleIdValues = EnumValues({
  "QwmL": PurpleId.QWM_L,
  "Q%7CDT": PurpleId.Q_7_CDT,
  "rZO%5E": PurpleId.R_ZO_5_E
});

enum PurpleType { NUMBER }

final purpleTypeValues = EnumValues({
  "number": PurpleType.NUMBER
});

class Fluffy {
  Fluffy({
    required this.id,
    required this.type,
    required this.checkbox,
  });

  final TentacledId id;
  final TentacledType type;
  final bool checkbox;

  factory Fluffy.fromJson(Map<String, dynamic> json) => Fluffy(
    id: tentacledIdValues.map[json["id"]]!,
    type: tentacledTypeValues.map[json["type"]]!,
    checkbox: json["checkbox"],
  );

  Map<String, dynamic> toJson() => {
    "id": tentacledIdValues.reverse[id],
    "type": tentacledTypeValues.reverse[type],
    "checkbox": checkbox,
  };
}

enum TentacledId { QY_FK }

final tentacledIdValues = EnumValues({
  "QYFk": TentacledId.QY_FK
});

enum TentacledType { CHECKBOX }

final tentacledTypeValues = EnumValues({
  "checkbox": TentacledType.CHECKBOX
});

class Purple {
  Purple({
    required this.id,
    required this.type,
    required this.files,
  });

  final FluffyId id;
  final FluffyType type;
  final List<FileElement> files;

  factory Purple.fromJson(Map<String, dynamic> json) => Purple(
    id: fluffyIdValues.map[json["id"]]!,
    type: fluffyTypeValues.map[json["type"]]!,
    files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": fluffyIdValues.reverse[id],
    "type": fluffyTypeValues.reverse[type],
    "files": List<dynamic>.from(files.map((x) => x.toJson())),
  };
}

class FileElement {
  FileElement({
    required this.name,
    required this.type,
    required this.file,
  });

  final String name;
  final FileType type;
  final FileFile file;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    name: json["name"],
    type: fileTypeValues.map[json["type"]]!,
    file: FileFile.fromJson(json["file"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": fileTypeValues.reverse[type],
    "file": file.toJson(),
  };
}

class FileFile {
  FileFile({
    required this.url,
    required this.expiryTime,
  });

  final String url;
  final DateTime expiryTime;

  factory FileFile.fromJson(Map<String, dynamic> json) => FileFile(
    url: json["url"],
    expiryTime: DateTime.parse(json["expiry_time"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "expiry_time": expiryTime.toIso8601String(),
  };
}

enum FileType { FILE }

final fileTypeValues = EnumValues({
  "file": FileType.FILE
});

enum FluffyId { RUL_5_D }

final fluffyIdValues = EnumValues({
  "rul%5D": FluffyId.RUL_5_D
});

enum FluffyType { FILES }

final fluffyTypeValues = EnumValues({
  "files": FluffyType.FILES
});

class Name {
  Name({
    required this.id,
    required this.type,
    required this.title,
  });

  final NameId id;
  final NameId type;
  final List<Title> title;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    id: nameIdValues.map[json["id"]]!,
    type: nameIdValues.map[json["type"]]!,
    title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": nameIdValues.reverse[id],
    "type": nameIdValues.reverse[type],
    "title": List<dynamic>.from(title.map((x) => x.toJson())),
  };
}

enum NameId { TITLE }

final nameIdValues = EnumValues({
  "title": NameId.TITLE
});

class Title {
  Title({
    required this.type,
    required this.text,
    required this.annotations,
    required this.plainText,
    required this.href,
  });

  final TitleType type;
  final Text text;
  final Annotations annotations;
  final String plainText;
  final dynamic href;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    type: titleTypeValues.map[json["type"]]!,
    text: Text.fromJson(json["text"]),
    annotations: Annotations.fromJson(json["annotations"]),
    plainText: json["plain_text"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "type": titleTypeValues.reverse[type],
    "text": text.toJson(),
    "annotations": annotations.toJson(),
    "plain_text": plainText,
    "href": href,
  };
}

class Annotations {
  Annotations({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final Color color;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
    bold: json["bold"],
    italic: json["italic"],
    strikethrough: json["strikethrough"],
    underline: json["underline"],
    code: json["code"],
    color: colorValues.map[json["color"]]!,
  );

  Map<String, dynamic> toJson() => {
    "bold": bold,
    "italic": italic,
    "strikethrough": strikethrough,
    "underline": underline,
    "code": code,
    "color": colorValues.reverse[color],
  };
}

enum Color { DEFAULT }

final colorValues = EnumValues({
  "default": Color.DEFAULT
});

class Text {
  Text({
    required this.content,
    required this.link,
  });

  final String content;
  final dynamic link;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
    content: json["content"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "link": link,
  };
}

enum TitleType { TEXT }

final titleTypeValues = EnumValues({
  "text": TitleType.TEXT
});

class Class {
  Class({
    required this.id,
    required this.type,
    required this.select,
  });

  final IdEnum id;
  final TypeEnum type;
  final Select select;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: idEnumValues.map[json["id"]]!,
    type: typeEnumValues.map[json["type"]]!,
    select: Select.fromJson(json["select"]),
  );

  Map<String, dynamic> toJson() => {
    "id": idEnumValues.reverse[id],
    "type": typeEnumValues.reverse[type],
    "select": select.toJson(),
  };
}

enum IdEnum { J_60_X }

final idEnumValues = EnumValues({
  "J%60X~": IdEnum.J_60_X
});

class Select {
  Select({
    required this.id,
    required this.name,
    required this.color,
  });

  final String id;
  final String name;
  final String color;

  factory Select.fromJson(Map<String, dynamic> json) => Select(
    id: json["id"],
    name: json["name"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "color": color,
  };
}

enum TypeEnum { SELECT }

final typeEnumValues = EnumValues({
  "select": TypeEnum.SELECT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
