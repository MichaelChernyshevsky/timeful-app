import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          color: Colors.purple,
          height: h * 0.05,
          width: w * 0.23,
          widget: Center(
            child: CustomText(text: text),
          ),
        ),
      ),
    );
  }
}

class StartOrStop extends StatelessWidget {
  const StartOrStop({
    super.key,
    required this.isStart,
    required this.onTap,
  });

  final bool isStart;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          color: isStart ? UTILSConstants.purple : UTILSConstants.grey1,
          colorBorder: UTILSConstants.purple,
          height: h * 0.07,
          width: w * 0.38,
          widget: Center(
            child: CustomText(text: isStart ? AppLocalizations.current.start : AppLocalizations.current.stop),
          ),
        ),
      ),
    );
  }
}
