import 'topic.dart';

class Field {
  Field({
    this.name,
    this.description,
    this.image,
    this.facultyId,
    this.uid,
    this.topics,
  });

  final String? name;
  final String? description;
  final String? image;
  final String? facultyId;
  final String? uid;
  final List<Topic>? topics;

  Field copyWith({
    String? name,
    String? description,
    String? image,
    String? facultyId,
    String? uid,
    List<Topic>? topics,
  }) =>
      Field(
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        facultyId: facultyId ?? this.facultyId,
        uid: uid ?? this.uid,
        topics: topics ?? this.topics,
      );

  factory Field.fromMap(Map<String, dynamic> json) => Field(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        facultyId: json["facultyId"],
        uid: json["uid"],
        topics: json["topics"] == null
            ? null
            : List<Topic>.from(json["topics"].map((x) => Topic.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "image": image,
        "facultyId": facultyId,
        "uid": uid,
        "topics": topics == null
            ? null
            : List<dynamic>.from(topics!.map((x) => x.toMap())),
      };
}
