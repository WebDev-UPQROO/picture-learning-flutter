class ResultsUI {
  int score;
  int total;

  ResultsUI({
    required this.score,
    required this.total,
  });

  ResultsUI copyWith({
    int? score,
    int? total,
  }) {
    return ResultsUI(
      score: score ?? this.score,
      total: total ?? this.total,
    );
  }
}
