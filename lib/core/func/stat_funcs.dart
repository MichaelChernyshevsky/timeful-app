bool checkDate({required String str}) =>
    getDate() == str.split('*****date*****')[0];

String getDate() {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .toString()
      .split(' ')[0];
}

List<String> getIdDone({required String str}) {
  final id = str.split('*****');
  return id.getRange(2, id.length).toList();
}
