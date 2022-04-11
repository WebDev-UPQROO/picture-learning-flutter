class Topic {
  Topic({
    this.name,
    this.description,
    this.image,
    this.fieldId,
    this.uid,
  });

  final String? name;
  final String? description;
  final String? image;
  final String? fieldId;
  final String? uid;

  Topic copyWith({
    String? name,
    String? description,
    String? image,
    String? fieldId,
    String? uid,
  }) =>
      Topic(
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        fieldId: fieldId ?? this.fieldId,
        uid: uid ?? this.uid,
      );

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        fieldId: json["fieldId"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "image": image,
        "fieldId": fieldId,
        "uid": uid,
      };
}
