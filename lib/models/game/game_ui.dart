class GameUI {
  String uid;
  String? name;

  GameUI({
    required this.uid,
    this.name,
  });

  GameUI copyWith({
    String? uid,
    String? name,
  }) {
    return GameUI(
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }
}
