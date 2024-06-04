// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, lines_longer_than_80_chars
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    this.width,
    this.height = 40,
    required this.color,
    this.text = '',
    this.padding,
    this.child,
    this.colorBorder,
    required this.tap,
  });

  final double? width;
  final double height;
  final Color color;
  final Color? colorBorder;
  final String text;
  final EdgeInsetsGeometry? padding;
  final VoidCallback tap;
  Widget? child;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? getPadding(all: 0),
      child: GestureDetector(
        onTap: widget.tap,
        child: widget.child == null
            ? CustomContainer(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                colorBorder: widget.colorBorder,
                widget: Center(
                  child: CustomText(
                    text: widget.text,
                  ),
                ),
              )
            : widget,
      ),
    );
  }
}
