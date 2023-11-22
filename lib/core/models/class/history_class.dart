class HistoryElement {
  HistoryElement({
    required this.title,
    required this.count,
    required this.isSpending,
    required this.description,
    required this.date,
  });

  String title;
  int count;
  String? description;
  DateTime? date;
  bool isSpending;
}
