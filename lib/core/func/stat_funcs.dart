bool checkDate({required String str}) => getDate() == str.split('-date-')[0];

String getDate() {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .toString()
      .split(' ')[0];
}
