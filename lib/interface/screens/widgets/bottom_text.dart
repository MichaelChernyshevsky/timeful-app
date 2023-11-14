import 'package:app_with_apps/interface/exports/screens_exports.dart';

class BottomText extends StatefulWidget {
  const BottomText({
    super.key,
    required this.tap_1,
    required this.tap_2,
    required this.text_1,
    required this.text_2,
  });

  final String text_1;
  final String text_2;

  final VoidCallback tap_1;
  final VoidCallback tap_2;

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 25, left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              widget.tap_1();
            },
            child: CustomText(
              text: widget.text_1,
              fontSize: TextEnum.bottom,
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.tap_2();
            },
            child: CustomText(
              text: widget.text_2,
              fontSize: TextEnum.bottom,
            ),
          ),
        ],
      ),
    );
  }
}
