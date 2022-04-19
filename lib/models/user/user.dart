class User {
  User({
    this.username,
    this.email,
    this.perfectTopics,
    this.perfectFields,
    this.perfectLevels,
    this.uid,
    this.facultyId,
  });

  final String? username;
  final String? email;
  final List<String>? perfectTopics;
  final List<String>? perfectFields;
  final List<String>? perfectLevels;
  final String? uid;
  final String? facultyId;

  User copyWith({
    String? username,
    String? email,
    List<String>? perfectTopics,
    List<String>? perfectFields,
    List<String>? perfectLevels,
    String? uid,
    String? facultyId,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
        perfectTopics: perfectTopics ?? this.perfectTopics,
        perfectFields: perfectFields ?? this.perfectFields,
        perfectLevels: perfectLevels ?? this.perfectLevels,
        uid: uid ?? this.uid,
        facultyId: facultyId ?? this.facultyId,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        facultyId: json["facultyId"],
        perfectTopics: json["perfect_topics"] == null
            ? null
            : List<String>.from(json["perfect_topics"].map((x) => x)),
        perfectFields: json["perfect_fields"] == null
            ? null
            : List<String>.from(json["perfect_fields"].map((x) => x)),
        perfectLevels: json["perfect_levels"] == null
            ? null
            : List<String>.from(json["perfect_levels"].map((x) => x)),
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "facultyId": facultyId,
        "perfect_topics": perfectTopics == null
            ? null
            : List<dynamic>.from(perfectTopics!.map((x) => x)),
        "perfect_fields": perfectFields == null
            ? null
            : List<dynamic>.from(perfectFields!.map((x) => x)),
        "perfect_levels": perfectLevels == null
            ? null
            : List<dynamic>.from(perfectLevels!.map((x) => x)),
        "uid": uid,
      };
}
