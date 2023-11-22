import 'package:app_with_apps/interface/exports/screens_exports.dart';

class SpendingWidget extends StatelessWidget {
  const SpendingWidget({
    super.key,
    required this.element,
  });

  final HistoryElement element;

  @override
  Widget build(BuildContext context) {
    final sign = element.isSpending == true ? '-' : '+';

    final color = element.isSpending == true
        ? UTILSConstants.grey
        : UTILSConstants.purple;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              '12.09.2023',
              style: TextStyle(color: color),
            ),
          ),
          CustomContainer(
            colorBorder: color,
            height: 100,
            width: 300,
            widget: Column(
              children: [
                Text(
                  element.title,
                  style: TextStyle(color: color),
                ),
                Text(
                  '$sign  ${element.count}',
                  style: TextStyle(color: color),
                ),
              ],
            ),
          ),
          GestureDetector(
            // ignore: avoid_print
            onTap: () => print(1),
            child: Icon(
              Icons.chevron_right_rounded,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
