class User {
  User({
    this.username,
    this.email,
    this.status,
    this.google,
    this.career,
    this.perfectFields,
    this.perfectLevels,
    this.uid,
  });

  final String? username;
  final String? email;
  final bool? status;
  final bool? google;
  final String? career;
  final List<dynamic>? perfectFields;
  final List<dynamic>? perfectLevels;
  final String? uid;

  User copyWith({
    String? username,
    String? email,
    bool? status,
    bool? google,
    String? career,
    List<dynamic>? perfectFields,
    List<dynamic>? perfectLevels,
    String? uid,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
        status: status ?? this.status,
        google: google ?? this.google,
        career: career ?? this.career,
        perfectFields: perfectFields ?? this.perfectFields,
        perfectLevels: perfectLevels ?? this.perfectLevels,
        uid: uid ?? this.uid,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        status: json["status"],
        google: json["google"],
        career: json["career"],
        perfectFields: json["perfect_fields"] == null
            ? null
            : List<dynamic>.from(json["perfect_fields"].map((x) => x)),
        perfectLevels: json["perfect_levels"] == null
            ? null
            : List<dynamic>.from(json["perfect_levels"].map((x) => x)),
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "status": status,
        "google": google,
        "career": career,
        "perfect_fields": perfectFields == null
            ? null
            : List<dynamic>.from(perfectFields!.map((x) => x)),
        "perfect_levels": perfectLevels == null
            ? null
            : List<dynamic>.from(perfectLevels!.map((x) => x)),
        "uid": uid,
      };
}
