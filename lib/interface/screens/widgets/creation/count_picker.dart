import 'package:app_with_apps/interface/exports/screens_exports.dart';

class CountPicker extends StatefulWidget {
  const CountPicker({
    super.key,
    required this.count,
    required this.value,
  });

  final int count;
  final Function(int count) value;

  @override
  State<CountPicker> createState() => _CountPickerState();
}

class _CountPickerState extends State<CountPicker> {
  void increase() => widget.value(widget.count + 1);
  void decrease() => widget.value(widget.count - 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(all: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: decrease,
            child: const Text('-'),
          ),
          Text(widget.count.toString()),
          GestureDetector(
            onTap: increase,
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}
