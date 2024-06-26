import 'package:app_with_apps/core/service/stat/stat.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/screens/edit_todo_screen.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({
    super.key,
    required this.element,
  });

  TaskModel element;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Color? color;

  @override
  void initState() {
    color = widget.element.isDone ? UTILSConstants.done : UTILSConstants.undone;
    super.initState();
  }

  void changeState({required String id, required bool isDone}) => setState(() {
        GetIt.I.get<StatService>().tasks.changeStateElement(id);
        if (isDone) {
          color = UTILSConstants.undone;
          widget.element.isDone = false;
        } else {
          color = UTILSConstants.done;
          widget.element.isDone = true;
        }
      });

  void goToElement() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditToDoScreen(
            element: widget.element,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        GestureDetector(
          onTap: () => changeState(
            id: widget.element.id,
            isDone: widget.element.isDone,
          ),
          child: Icon(
            widget.element.isDone ? Icons.check_box_outlined : Icons.check_box_outline_blank,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.05),
          child: SizedBox(
            width: w * 0.68,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    widget.element.title,
                    style: TextStyle(fontSize: h * 0.03),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
