import 'package:app_with_apps/interface/exports/screens_exports.dart';

class Note extends StatelessWidget {
  const Note({
    super.key,
    required this.element,
  });

  final HistoryElement element;

  @override
  Widget build(BuildContext context) {
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
            color: UTILSConstants.white,
            height: 100,
            width: 300,
            widget: Row(
              children: [
                Text(element.title),
                Text(element.count.toString()),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => print(1),
            child: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
