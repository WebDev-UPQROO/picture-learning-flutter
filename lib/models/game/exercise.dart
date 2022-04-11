class Exercise {
  Exercise({
    this.options,
    this.answer,
    this.image,
    this.topicId,
    this.uid,
  });

  final List<String>? options;
  final String? answer;
  final String? image;
  final String? topicId;
  final String? uid;

  Exercise copyWith({
    List<String>? options,
    String? answer,
    String? image,
    String? topicId,
    String? uid,
  }) =>
      Exercise(
        options: options ?? this.options,
        answer: answer ?? this.answer,
        image: image ?? this.image,
        topicId: topicId ?? this.topicId,
        uid: uid ?? this.uid,
      );

  factory Exercise.fromMap(Map<String, dynamic> json) => Exercise(
        options: json["options"] == null
            ? null
            : List<String>.from(json["options"].map(
                (x) => x,
              )),
        answer: json["answer"],
        image: json["image"],
        topicId: json["topicId"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map(
                (x) => x,
              )),
        "answer": answer,
        "image": image,
        "topicId": topicId,
        "uid": uid,
      };
}
