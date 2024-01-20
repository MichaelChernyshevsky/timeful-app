import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TitleStat extends StatelessWidget {
  const TitleStat({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 20, bottom: 20),
      child: Center(
        child: CustomText(text: text),
      ),
    );
  }
}
