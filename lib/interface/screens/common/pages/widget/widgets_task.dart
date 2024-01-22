import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/screens/edit_todo_screen.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({
    super.key,
    required this.element,
  });

  TaskElement element;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Color? color;

  @override
  void initState() {
    color = widget.element.isDone ? UTILSConstants.done : UTILSConstants.undone;
    GetIt.I
        .get<StatProvider>()
        .setTask(isDone: widget.element.isDone, withMinus: false);
    super.initState();
  }

  void changeState({required id, required isDone}) => setState(() {
        if (isDone) {
          GetIt.I.get<StatProvider>().setTaskUndone(id: id);
          color = UTILSConstants.undone;
          widget.element.isDone = false;
        } else {
          GetIt.I.get<StatProvider>().setTaskDone(id: id);
          color = UTILSConstants.done;
          widget.element.isDone = true;
        }
      });

  void goToElement(context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditToDoScreen(
            element: widget.element,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: getWidth(100),
        child: GestureDetector(
          onTap: () => changeState(
            id: widget.element.id,
            isDone: widget.element.isDone,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                // colorBorder: widget.element.color,
                colorBorder: color,
                height: 50,
                width: 350,
                widget: Row(
                  children: [
                    // Icon(
                    //   widget.element.icon.icon,
                    //   color: widget.element.color,
                    // ),
                    const Spacer(),
                    Text(
                      widget.element.title,
                      // style: TextStyle(color: widget.element.color),
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
      ),
    );
  }
}
