import 'package:app_with_apps/interface/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/interface/utils/enum/text_enum.dart';

class UtilsFuns {
  static double getFontSize({required TextEnum style}) {
    if (style == TextEnum.title) {
      return UTILSConstants.titleSize;
    } else if (style == TextEnum.bottom) {
      return UTILSConstants.bottomText;
    }
    return UTILSConstants.commonSize;
  }
}
