// To parse this JSON data, do
//
//     final lab = labFromJson(jsonString);

import 'dart:convert';

Lab labFromJson(String str) => Lab.fromJson(json.decode(str));

String labToJson(Lab data) => json.encode(data.toJson());

class Lab {
  Lab({
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

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
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
    required this.date,
    required this.person,
    required this.filesMedia1,
    required this.properties,
    required this.empty,
    required this.pdf,
    required this.filesMedia2,
    required this.filesMedia,
    required this.tags,
    required this.name,
  });

  final Date date;
  final Person person;
  final FilesMedia filesMedia1;
  final FilesMedia properties;
  final Empty empty;
  final FilesMedia pdf;
  final FilesMedia filesMedia2;
  final FilesMedia filesMedia;
  final Tags tags;
  final Name name;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    date: Date.fromJson(json["Date"]),
    person: Person.fromJson(json["Person"]),
    filesMedia1: FilesMedia.fromJson(json["Files & media 1"]),
    properties: FilesMedia.fromJson(json["صورة"]),
    empty: Empty.fromJson(json["المرحله"]),
    pdf: FilesMedia.fromJson(json["pdf"]),
    filesMedia2: FilesMedia.fromJson(json["Files & media 2"]),
    filesMedia: FilesMedia.fromJson(json["Files & media"]),
    tags: Tags.fromJson(json["Tags"]),
    name: Name.fromJson(json["Name"]),
  );

  Map<String, dynamic> toJson() => {
    "Date": date.toJson(),
    "Person": person.toJson(),
    "Files & media 1": filesMedia1.toJson(),
    "صورة": properties.toJson(),
    "المرحله": empty.toJson(),
    "pdf": pdf.toJson(),
    "Files & media 2": filesMedia2.toJson(),
    "Files & media": filesMedia.toJson(),
    "Tags": tags.toJson(),
    "Name": name.toJson(),
  };
}

class Date {
  Date({
    required this.id,
    required this.type,
    required this.date,
  });

  final DateId id;
  final DateType type;
  final DateClass date;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: dateIdValues.map[json["id"]]!,
    type: dateTypeValues.map[json["type"]]!,
    date: DateClass.fromJson(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": dateIdValues.reverse[id],
    "type": dateTypeValues.reverse[type],
    "date": date.toJson(),
  };
}

class DateClass {
  DateClass({
    required this.start,
    required this.end,
    required this.timeZone,
  });

  final DateTime start;
  final dynamic end;
  final dynamic timeZone;

  factory DateClass.fromJson(Map<String, dynamic> json) => DateClass(
    start: DateTime.parse(json["start"]),
    end: json["end"],
    timeZone: json["time_zone"],
  );

  Map<String, dynamic> toJson() => {
    "start": "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end": end,
    "time_zone": timeZone,
  };
}

enum DateId { AX_5_BL }

final dateIdValues = EnumValues({
  "Ax%5BL": DateId.AX_5_BL
});

enum DateType { DATE }

final dateTypeValues = EnumValues({
  "date": DateType.DATE
});

class Empty {
  Empty({
    required this.id,
    required this.type,
    required this.select,
  });

  final Id id;
  final Type type;
  final Select select;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    id: idValues.map[json["id"]]!,
    type: typeValues.map[json["type"]]!,
    select: Select.fromJson(json["select"]),
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "type": typeValues.reverse[type],
    "select": select.toJson(),
  };
}

enum Id { KKF_7_D }

final idValues = EnumValues({
  "Kkf%7D": Id.KKF_7_D
});

class Select {
  Select({
    required this.id,
    required this.name,
    required this.color,
  });

  final String id;
  final NameEnum name;
  final SelectColor color;

  factory Select.fromJson(Map<String, dynamic> json) => Select(
    id: json["id"],
    name: nameEnumValues.map[json["name"]]!,
    color: selectColorValues.map[json["color"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameEnumValues.reverse[name],
    "color": selectColorValues.reverse[color],
  };
}

enum SelectColor { PURPLE, BLUE, GREEN, PINK }

final selectColorValues = EnumValues({
  "blue": SelectColor.BLUE,
  "green": SelectColor.GREEN,
  "pink": SelectColor.PINK,
  "purple": SelectColor.PURPLE
});

enum NameEnum { EMPTY, NAME, PURPLE, FLUFFY }

final nameEnumValues = EnumValues({
  "المرحلة الثالثة": NameEnum.EMPTY,
  "المرحلة الاولى": NameEnum.FLUFFY,
  "المرحلة الرابعة": NameEnum.NAME,
  "المرحلة الثانية": NameEnum.PURPLE
});

enum Type { SELECT }

final typeValues = EnumValues({
  "select": Type.SELECT
});

class FilesMedia {
  FilesMedia({
    required this.id,
    required this.type,
    required this.files,
  });

  final FilesMediaId id;
  final FilesMediaType type;
  final List<FileElement> files;

  factory FilesMedia.fromJson(Map<String, dynamic> json) => FilesMedia(
    id: filesMediaIdValues.map[json["id"]]!,
    type: filesMediaTypeValues.map[json["type"]]!,
    files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": filesMediaIdValues.reverse[id],
    "type": filesMediaTypeValues.reverse[type],
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

enum FilesMediaId { VUUZ, C_3_DGR, VB_ZQ, M_5_E_7_BW, KA_40_V }

final filesMediaIdValues = EnumValues({
  "C%3DGR": FilesMediaId.C_3_DGR,
  "Ka%40V": FilesMediaId.KA_40_V,
  "m%5E%7Bw": FilesMediaId.M_5_E_7_BW,
  "vbZQ": FilesMediaId.VB_ZQ,
  "vuuz": FilesMediaId.VUUZ
});

enum FilesMediaType { FILES }

final filesMediaTypeValues = EnumValues({
  "files": FilesMediaType.FILES
});

class Name {
  Name({
    required this.id,
    required this.type,
    required this.title,
  });

  final TypeEnum id;
  final TypeEnum type;
  final List<Title> title;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    id: typeEnumValues.map[json["id"]]!,
    type: typeEnumValues.map[json["type"]]!,
    title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": typeEnumValues.reverse[id],
    "type": typeEnumValues.reverse[type],
    "title": List<dynamic>.from(title.map((x) => x.toJson())),
  };
}

enum TypeEnum { TITLE }

final typeEnumValues = EnumValues({
  "title": TypeEnum.TITLE
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
  final AnnotationsColor color;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
    bold: json["bold"],
    italic: json["italic"],
    strikethrough: json["strikethrough"],
    underline: json["underline"],
    code: json["code"],
    color: annotationsColorValues.map[json["color"]]!,
  );

  Map<String, dynamic> toJson() => {
    "bold": bold,
    "italic": italic,
    "strikethrough": strikethrough,
    "underline": underline,
    "code": code,
    "color": annotationsColorValues.reverse[color],
  };
}

enum AnnotationsColor { DEFAULT }

final annotationsColorValues = EnumValues({
  "default": AnnotationsColor.DEFAULT
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

class Person {
  Person({
    required this.id,
    required this.type,
    required this.people,
  });

  final PersonId id;
  final PersonType type;
  final List<dynamic> people;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: personIdValues.map[json["id"]]!,
    type: personTypeValues.map[json["type"]]!,
    people: List<dynamic>.from(json["people"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": personIdValues.reverse[id],
    "type": personTypeValues.reverse[type],
    "people": List<dynamic>.from(people.map((x) => x)),
  };
}

enum PersonId { BX_GS }

final personIdValues = EnumValues({
  "BxGS": PersonId.BX_GS
});

enum PersonType { PEOPLE }

final personTypeValues = EnumValues({
  "people": PersonType.PEOPLE
});

class Tags {
  Tags({
    required this.id,
    required this.type,
    required this.multiSelect,
  });

  final TagsId id;
  final TagsType type;
  final List<dynamic> multiSelect;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    id: tagsIdValues.map[json["id"]]!,
    type: tagsTypeValues.map[json["type"]]!,
    multiSelect: List<dynamic>.from(json["multi_select"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": tagsIdValues.reverse[id],
    "type": tagsTypeValues.reverse[type],
    "multi_select": List<dynamic>.from(multiSelect.map((x) => x)),
  };
}

enum TagsId { Z_I_JC }

final tagsIdValues = EnumValues({
  "zIJc": TagsId.Z_I_JC
});

enum TagsType { MULTI_SELECT }

final tagsTypeValues = EnumValues({
  "multi_select": TagsType.MULTI_SELECT
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
