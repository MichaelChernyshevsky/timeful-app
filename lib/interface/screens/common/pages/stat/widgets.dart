import 'package:app_with_apps/interface/exports/screens_exports.dart';

class StatForm extends StatelessWidget {
  const StatForm({
    super.key,
    required this.widgets,
    required this.w,
    required this.h,
  });

  final List<Widget> widgets;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(w),
      height: getHeight(h),
      decoration: BoxDecoration(
        color: UTILSConstants.grey2,
        borderRadius: const BorderRadius.all(
          Radius.circular(35),
        ),
      ),
      child: Padding(
        padding: getPadding(top: 26, bottom: 26, left: 16, right: 16),
        child: Center(child: Column(children: widgets)),
      ),
    );
  }
}
