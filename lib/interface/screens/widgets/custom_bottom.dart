// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    this.width,
    this.height = 40,
    required this.color,
    this.text = '',
    this.padding,
    this.element,
    required this.tap,
  });

  final double? width;
  final double height;
  final Color color;
  final String text;
  final EdgeInsetsGeometry? padding;
  final VoidCallback tap;
  Widget? element;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? getPadding(all: 0),
      child: GestureDetector(
        onTap: () {
          widget.tap();
        },
        child: widget.element == null
            ? CustomContainer(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                widget: Center(
                  child: CustomText(text: widget.text),
                ),
              )
            : widget,
      ),
    );
  }
}
