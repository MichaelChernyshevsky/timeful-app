String getNumber(int time) {
  var minutes = '';
  var seconds = '';

  final minute = time ~/ 60;
  minutes = minute.toString() == '0' ? '00' : minute.toString();
  final second = (time - minute * 60).toString();
  seconds = second == '0' ? '00' : second;
  print('minute $minute seconds $second');
  return '$minutes : $seconds';
}
