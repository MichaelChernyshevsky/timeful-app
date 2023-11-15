class HistoryElement {
  HistoryElement({
    required this.title,
    required this.count,
    this.description,
    this.date,
  });

  final String title;
  final int count;
  final String? description;
  final DateTime? date;
}
