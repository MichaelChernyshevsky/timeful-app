class HistoryElement {
  HistoryElement({
    required this.title,
    required this.count,
    required this.isSpending,
    required this.description,
    required this.date,
  });

  final String title;
  final int count;
  final String? description;
  final DateTime? date;
  final bool isSpending;
}
