import 'package:app_with_apps/core/manager/tasks_bloc/tasks_bloc.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/core/models/enum/part_time__enum.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:app_with_apps/interface/screens/widgets/creation/color_element.dart';
import 'package:app_with_apps/interface/screens/widgets/creation/count_picker.dart';
import 'package:app_with_apps/interface/screens/widgets/creation/day_part_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) => TasksBloc(),
      child: const CreateTaskScreen(),
    );
  }

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController contorllerTitle = TextEditingController();
  int count = 1;
  int countOnDay = 1;
  Icon icon = const Icon(Icons.abc);
  Color color = Colors.white;
  int timeOfDay = 0;
  TasksBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<TasksBloc>(context);
    super.initState();
  }

  void addTask() {
    if (contorllerTitle.text.isNotEmpty) {
      final task = Task(
        title: contorllerTitle.text,
        icon: icon,
        color: color,
        id: 1,
        count: count,
        countOnDay: countOnDay,
        timeOfDay: GetIt.I.get<AppProvider>().partTime[timeOfDay],
      );

      bloc!.add(AddTaskEvent(task: task));
    }
  }

  void setCount(int newCount) => setState(() {
        count = newCount;
      });

  void setCountOnDay(int newCount) => setState(() {
        countOnDay = newCount;
      });

  void setColor(Color newColor) => setState(() {
        color = newColor;
      });

  @override
  Widget build(BuildContext context) {
    return Body(
      appBar: AppBar(
        title: Text(AppLocalizations.current.createTask),
      ),
      widget: Column(
        children: [
          Text(AppLocalizations.current.pasteTitle),
          TextFormField(controller: contorllerTitle),
          Text(AppLocalizations.current.pasteCount),
          CountPicker(
            count: count,
            value: setCount,
          ),
          Text(AppLocalizations.current.pasteCountOnDay),
          CountPicker(
            count: countOnDay,
            value: setCountOnDay,
          ),
          Text(AppLocalizations.current.color),
          //  DayPartPicker(currentIndex: null, value: (int count) {  },),
          Text(AppLocalizations.current.color),
          SizedBox(
            width: size.width,
            height: getHeight(60),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: GetIt.I.get<AppProvider>().colorsList.length,
              itemBuilder: (context, index) {
                final colorByIndex =
                    GetIt.I.get<AppProvider>().colorsList[index];
                return GestureDetector(
                  child: ColorPickerElement(colorByIndex: colorByIndex),
                  onTap: () => setColor(colorByIndex),
                );
              },
            ),
          ),
          CustomButton(color: UTILSConstants.purple, tap: addTask),
        ],
      ),
    );
  }
}
