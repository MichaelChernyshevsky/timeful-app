// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/core/utils/enum/text_enum.dart';
import 'package:app_with_apps/core/utils/funcs/text_func.dart';
import 'package:app_with_apps/core/utils/utils_size.dart';

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
