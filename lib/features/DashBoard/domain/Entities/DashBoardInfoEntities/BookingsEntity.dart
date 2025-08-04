class BookingsEntity {
  final int current;
  final int previous;
  final String trend;
  final int change;
  final int total;

  const BookingsEntity({
    required this.current,
    required this.previous,
    required this.change,
    required this.trend,
    required this.total,
  });
}
