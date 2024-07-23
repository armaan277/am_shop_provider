class Rating {
  final num rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map mapRating) {
    return Rating(
      rate: mapRating['rate'] ?? 0,
      count: mapRating['count'] ?? 0,
    );
  }
}