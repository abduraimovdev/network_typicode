import 'dart:io';

void jsonToDart({
  required Map<String, Object?> json,
  required String path,
  required String name,
}) async {
  StringBuffer jsonToClass = StringBuffer();
  String className = name[0].toUpperCase() + name.substring(1);

  // Class name
  jsonToClass.write("class $className {\n");

  // Fields
  json.forEach((key, value) {
    if (value.runtimeType.toString().substring(0, 3) == "_Ma") {
      String cname = key[0].toUpperCase() + key.substring(1);
      jsonToClass.writeln("\t$cname $key;");
      jsonToDart(json: value as Map<String, Object?>, path: path, name: key);
    } else if (value.runtimeType.toString().substring(0, 3) == "Lis") {
      String cname = key[0].toUpperCase() + key.substring(1);
      jsonToClass.writeln("\tList<$cname> $key;");
      jsonToDart(
          json: (value as List)[0] as Map<String, Object?>,
          path: path,
          name: key);
    } else {
      jsonToClass.writeln("\t${value.runtimeType} $key;");
    }
  });

  // Constructor
  jsonToClass.write("\n\t$className(\n");

  //Constructor value
  json.forEach((key, value) => jsonToClass.writeln("\t\tthis.$key,"));


  //FromJson
  jsonToClass.writeln(
      "\t);\n\n\tfactory $className.fromJson(Map<String, Object?> json) {\n\t\treturn $className(");

  json.forEach((key, value) {
    if (value.runtimeType.toString().substring(0, 3) == "_Ma") {
      String cname = key[0].toUpperCase() + key.substring(1);
      jsonToClass.writeln(
          "\t\t\t$cname.fromJson(json['$key'] as Map<String, Object?>),");
    } else if (value.runtimeType.toString().substring(0, 3) == "Lis") {
      jsonToClass.writeln(
          "\t\t\tList.from(json['$key'] as List<Map<String, Object?>>).map((e) => Data.fromJson(e)).toList(),");
    } else {
      jsonToClass.writeln("\t\t\tjson['$key'] as ${value.runtimeType},");
    }
  });
  //FromJson End

  // ToJson
  jsonToClass.writeln("\t\t);\n\t}\n\n\tMap<String,Object?> toJson() => {");

  json.forEach((key, value) {
    if (value.runtimeType.toString().substring(0, 3) == "_Ma") {
      jsonToClass.writeln("\t\t'$key': $key.toJson(),");
    } else if (value.runtimeType.toString().substring(0, 3) == "Lis") {
      jsonToClass.writeln("\t\t'$key': $key.map((e) => e.toJson()).toList(),");
    } else {
      jsonToClass.writeln("\t\t'$key': $key,");
    }
  });

  // ToJson End
  jsonToClass.writeln("\t};\n}");


  // File Create
  File file = File("$path\\$name.dart");
  await file.create(recursive: true);
  await file.writeAsString(jsonToClass.toString());
}