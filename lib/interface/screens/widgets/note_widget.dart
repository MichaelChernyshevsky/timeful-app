import 'package:app_with_apps/interface/exports/screens_exports.dart';

class Note extends StatelessWidget {
  const Note({
    super.key,
    required this.element,
  });

  final HistoryElement element;

  @override
  Widget build(BuildContext context) {
    final sign = element.isSpending == true ? '-' : '+';

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RotatedBox(
            quarterTurns: -1,
            child: Text('12.09.2023'),
          ),
          CustomContainer(
            color: element.isSpending == true
                ? UTILSConstants.grey
                : UTILSConstants.purple,
            height: 100,
            width: 300,
            widget: Column(
              children: [
                Text(element.title),
                Text('$sign  ${element.count}'),
              ],
            ),
          ),
          GestureDetector(
            // ignore: avoid_print
            onTap: () => print(1),
            child: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
