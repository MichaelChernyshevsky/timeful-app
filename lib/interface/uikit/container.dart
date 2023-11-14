import 'package:app_with_apps/core/exports/exports.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.height = 42,
    this.width,
    this.color,
    required this.widget,
  });

  final double height;
  double? width;
  Color? color;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }
}
