import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.element,
  });

  final Task element;

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
            color: element.color,
            height: 100,
            width: 300,
            widget: Column(
              children: [
                Text(element.title),
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
