import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/core/utils/enum/text_enum.dart';
import 'package:app_with_apps/core/utils/funcs/text_func.dart';
import 'package:app_with_apps/core/utils/utils.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = TextEnum.common,
  });
  final String text;
  final TextEnum fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: UTILSConstants.textColor,
        fontSize: getFontSize(UtilsFuns.getFontSize(style: fontSize)),
        // fontFamily:
      ),
    );
  }
}
