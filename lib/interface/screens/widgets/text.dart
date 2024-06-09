// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/utils/funcs/text_func.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = TextEnum.common,
    this.color,
  });
  final String text;
  final TextEnum fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? UTILSConstants.textColor,
        fontSize: getFontSize(UtilsFuns.getFontSize(style: fontSize)),
        // fontFamily:
      ),
    );
  }
}
