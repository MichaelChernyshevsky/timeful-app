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
      children: [
        CustomButton(
          color: getColor(0),
          tap: () => setPart(0),
          element: Text(GetIt.I.get<AppProvider>().partTime[0].title),
        ),
        CustomButton(
          color: getColor(1),
          tap: () => setPart(1),
          element: Text(GetIt.I.get<AppProvider>().partTime[1].title),
        ),
        CustomButton(
          color: getColor(2),
          tap: () => setPart(2),
          element: Text(GetIt.I.get<AppProvider>().partTime[2].title),
        ),
        CustomButton(
          color: getColor(3),
          tap: () => setPart(3),
          element: Text(GetIt.I.get<AppProvider>().partTime[3].title),
        ),
      ],
    );
  }
}
