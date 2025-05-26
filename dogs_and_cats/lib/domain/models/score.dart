class Score {
  Score({
    this.id,
    required this.score,
    required this.orderId,
    required this.dogsitterId,
  });
  final String? id;
  final double score;
  final String orderId;
  final String dogsitterId;
}
