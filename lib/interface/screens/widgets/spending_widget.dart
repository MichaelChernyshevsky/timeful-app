import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/screens/edit_spending_screen.dart';

class SpendingWidget extends StatelessWidget {
  SpendingWidget({
    super.key,
    required this.element,
  });

  final HistoryElement element;
  bool validate = false;

  void goToElement(context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditSpendingScreen(
            element: element,
          ),
        ),
      );

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
          GestureDetector(
            onTap: () => goToElement(context),
            child: CustomContainer(
              colorBorder: color,
              height: 100,
              width: 350,
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
          ),
        ],
      ),
    );
  }
}
