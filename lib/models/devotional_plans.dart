import 'dart:convert';

import 'devotional.dart';

List<DevotionalPlan> devotionalPlansFromJson(List<dynamic> jsonList) {
  return List<DevotionalPlan>.from(
    jsonList.map(
      (x) => DevotionalPlan.fromJson(x),
    ),
  );
}

String devotionalPlansToJson(List<DevotionalPlan> data) {
  return json.encode(
    List<dynamic>.from(
      data.map((x) => x.toJson()),
    ),
  );
}

DevotionalPlan devotionalPlanWithIDFromJson(var js) =>
    DevotionalPlan.fromJson(js);

String devotionalPlansWithIDToJson(DevotionalPlan plans) =>
    json.encode(plans.toJson());

class DevotionalPlan {
  DevotionalPlan({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.devotionals,
  });

  String id, title, imageUrl, description;
  List<Devotional> devotionals;

  factory DevotionalPlan.fromJson(Map<String, dynamic> json) {
    return DevotionalPlan(
      id: json["id"],
      title: json["title"],
      imageUrl: json["imageUrl"],
      description: json["description"],
      devotionals: extractDevotionals(json['devotionals']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "imageUrl": imageUrl,
      "description": description,
      "devotionals": jsonEncode(
        devotionals
            .map(
              (e) => jsonEncode(e.toMap()),
            )
            .toList(),
      ),
    };
  }

  static extractDevotionals(devotionals) {
    if (devotionals.runtimeType.toString() != 'String') {
      return List.castFrom<dynamic, Devotional>(
          devotionals.map((e) => Devotional.fromJson(e)).toList());
    }
    devotionals = jsonDecode(devotionals);
    return List.castFrom<dynamic, Devotional>(
        devotionals.map((e) => Devotional.fromJson(jsonDecode(e))).toList());
  }
}
