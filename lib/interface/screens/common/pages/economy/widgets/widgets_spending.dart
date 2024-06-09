// ignore_for_file: type_annotate_public_apis, must_be_immutable

import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/screens/edit_spending_screen.dart';
import 'package:intl/intl.dart';

class SpendingWidget extends StatelessWidget {
  SpendingWidget({
    super.key,
    required this.element,
  });

  final EconomyModel element;
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

    final color = element.isSpending == true ? UTILSConstants.pink : UTILSConstants.white;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (element.date != null)
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.01),
            child: Row(
              children: [
                Text(DateFormat('kk:mm dd:MM:yyyy  ').format(element.date!)),
              ],
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h * 0.13,
              width: w * 0.80,
              decoration: BoxDecoration(
                color: UTILSConstants.grey2,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(element.title, style: TextStyle(color: color, fontSize: h * 0.02)),
                    const Spacer(),
                    Text('$sign  ${element.count}', style: TextStyle(color: color, fontSize: h * 0.04)),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );

    // Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       RotatedBox(
    //         quarterTurns: -1,
    //         child: Text(
    //           '12.09.2023',
    //           style: TextStyle(color: color),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () => goToElement(context),
    //         child: CustomContainer(
    //           colorBorder: color,
    //           height: 100,
    //           width: size.width * 0.8,
    //           widget: Column(
    //             children: [
    //               Text(
    //                 element.title,
    //                 style: TextStyle(color: color),
    //               ),
    //               Text(
    //                 '$sign  ${element.count}',
    //                 style: TextStyle(color: color),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
