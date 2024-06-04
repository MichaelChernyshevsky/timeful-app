import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/widgets/text.dart';

class CountPicker extends StatefulWidget {
  const CountPicker({
    super.key,
    required this.count,
    required this.value,
    required this.title,
  });

  final int count;
  final Function(int count) value;
  final String title;

  @override
  State<CountPicker> createState() => _CountPickerState();
}

class _CountPickerState extends State<CountPicker> {
  void increase() => widget.value(widget.count + 1);
  void decrease() => widget.value(widget.count - 1);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: h * 0.15),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: h * 0.02),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              color: UTILSConstants.purple,
              isPlus: false,
              size: h * 0.08,
              tap: decrease,
            ),
            CustomText(text: widget.count.toString()),
            RoundedButton(
              color: UTILSConstants.purple,
              isPlus: false,
              size: h * 0.08,
              tap: increase,
            ),
          ],
        ),
      ],
    );
  }
}
