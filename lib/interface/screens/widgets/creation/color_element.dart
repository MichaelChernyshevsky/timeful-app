import 'package:app_with_apps/interface/exports/screens_exports.dart';

class ColorPickerElement extends StatelessWidget {
  const ColorPickerElement({
    super.key,
    required this.colorByIndex,
  });

  final Color colorByIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(all: 10),
      child: Container(
        height: getHeight(40),
        width: getWidth(40),
        decoration: BoxDecoration(
          color: colorByIndex,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
