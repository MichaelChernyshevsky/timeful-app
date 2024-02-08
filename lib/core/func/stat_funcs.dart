bool checkDate({required String str}) {
  print('  $str  ${getDate()} == ${str.split('*****date*****')[0]}');
  return getDate() == str.split('*****date*****')[0];
}

String getDate() {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .toString()
      .split(' ')[0];
}

List<String> getIdDone({required String str}) {
  final idList = str.split('*****');

  return idList.getRange(2, idList.length).toList();
}

List<String> deleteId({required List<String> idList, required String id}) {
  for (var index = 0; index < idList.length; index += 1) {
    if (idList[index] == id) {
      idList.removeAt(index);
      return idList;
    }
  }
  return idList;
}

String getStr({required List<String> idList}) {
  var str = getDate();
  for (final id in idList) {
    str += '*****$id';
  }
  return str;
}

bool checkIDInList({required List<String> idList, required String id}) {
  for (var index = 0; index < idList.length; index += 1) {
    if (idList[index] == id) {
      return true;
    }
  }
  return false;
}
