import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.element,
  });

  final TaskElement element;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Color color = Colors.transparent;

  void changeColor() => setState(() {
        if (color == UTILSConstants.transparent) {
          color = UTILSConstants.done;
        } else {
          color = UTILSConstants.transparent;
        }
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: changeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
              colorBorder: widget.element.color,
              color: color,
              height: 50,
              width: 350,
              widget: Row(
                children: [
                  Icon(
                    widget.element.icon.icon,
                    color: widget.element.color,
                  ),
                  const Spacer(),
                  Text(
                    widget.element.title,
                    style: TextStyle(color: widget.element.color),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            // Padding(
            //   padding: getPadding(left: 20),
            //   child: GestureDetector(
            //     onTap: changeColor,
            //     child: Icon(
            //       Icons.check_circle_outline_rounded,
            //       color: color,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
