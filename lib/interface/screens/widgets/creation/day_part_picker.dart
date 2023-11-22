import 'package:app_with_apps/interface/exports/screens_exports.dart';

class DayPartPicker extends StatefulWidget {
  const DayPartPicker({
    super.key,
    required this.currentIndex,
    required this.value,
  });

  final int currentIndex;
  final Function(int count) value;

  @override
  State<DayPartPicker> createState() => _DayPartPickerState();
}

class _DayPartPickerState extends State<DayPartPicker> {
  void setPart(int index) => widget.value(index);

  Color getColor(int index) {
    if (widget.currentIndex == index) {
      return UTILSConstants.purple;
    }
    return UTILSConstants.black;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomContainer(
          color: getColor(0),
          widget: GestureDetector(
            onTap: () => widget.value(0),
            child: const Icon(Icons.sunny_snowing),
          ),
        ),
        CustomContainer(
          color: getColor(1),
          widget: GestureDetector(
            onTap: () => widget.value(1),
            child: const Icon(Icons.sunny),
          ),
        ),
        CustomContainer(
          color: getColor(2),
          widget: GestureDetector(
            onTap: () => widget.value(2),
            child: const Icon(Icons.sunny_snowing),
          ),
        ),
        CustomContainer(
          color: getColor(3),
          widget: GestureDetector(
            onTap: () => widget.value(3),
            child: const Icon(Icons.abc),
          ),
        ),
      ],
    );
  }
}
