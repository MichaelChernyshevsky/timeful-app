import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.height = 42,
    this.width,
    this.color,
    this.colorBorder,
    required this.widget,
  });

  final double height;
  double? width;
  Color? color;
  Color? colorBorder;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    late BoxDecoration decoration;
    if (colorBorder != null) {
      decoration = BoxDecoration(
        border: Border.all(color: colorBorder!, width: getWidth(2)),
        color: color ?? UTILSConstants.transparent,
        borderRadius: BorderRadius.circular(100),
      );
    } else {
      decoration = BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      );
    }

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: decoration,
      child: widget,
    );
  }
}
