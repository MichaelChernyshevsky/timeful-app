import 'package:app_with_apps/core/func/uuid.dart';
import 'package:app_with_apps/core/manager/tasks_bloc/tasks_bloc.dart';
import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/core/models/enum/part_time__enum.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
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
  // Icon icon = const Icon(Icons.abc);
  Color color = Colors.white;
  int timeOfDay = 0;
  TasksBloc? bloc;
  TaskElement? element;

  @override
  void initState() {
    bloc = BlocProvider.of<TasksBloc>(context);
    super.initState();
  }

  void setIndex({required int index}) => setState(() {
        timeOfDay = index;
      });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Body(
      widget: Stack(
        children: [
          Column(
            children: [
              PageTitle(h: h, text: AppLocalizations.current.createTask, onTap: goBack),
              Text(
                AppLocalizations.current.pasteTitle,
                style: TextStyle(fontSize: h * 0.02),
              ),
              Padding(
                padding: getPadding(top: h * 0.03, bottom: h * 0.03),
                child: TextFormField(
                  controller: contorllerTitle,
                  maxLines: 3,
                  decoration: InputDecoration(
                    fillColor: UTILSConstants.grey2,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(35),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                  ),
                ),
              ),

              CountPicker(
                title: AppLocalizations.current.pasteCount,
                count: count,
                value: setCount,
              ),
              CountPicker(
                title: AppLocalizations.current.pasteCountOnDay,
                count: countOnDay,
                value: setCountOnDay,
              ),
              // Text(AppLocalizations.current.day),
              // DayPartPicker(
              //   currentIndex: timeOfDay,
              //   value: (int count) => setIndex(index: count),
              // ),
              // Text(AppLocalizations.current.color),
              // SizedBox(
              //   width: size.width,
              //   height: getHeight(60),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: GetIt.I.get<AppProvider>().colorsList.length,
              //     itemBuilder: (context, index) {
              //       final colorByIndex = GetIt.I.get<AppProvider>().colorsList[index];
              //       return GestureDetector(
              //         child: ColorPickerElement(colorByIndex: colorByIndex),
              //         onTap: () => setColor(colorByIndex),
              //       );
              //     },
              //   ),
              // ),
              const Spacer(),
              BlocListener<TasksBloc, TasksBlocState>(
                listener: (context, state) => stateFunc(state),
                child: CustomButton(
                  color: Colors.green,
                  tap: addTask,
                  text: AppLocalizations.current.create,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TaskElement? createElement() {
    if (contorllerTitle.text.isEmpty) {
      return null;
    }

    final createdElement = TaskElement(
      title: contorllerTitle.text,
      count: count,
      id: getUUID(),
      // icon: icon,
      // color: color,
      isDone: false,
      countOnDay: countOnDay,
      timeOfDay: PartTime(
        index: timeOfDay,
        partTime: PartTimeEnum.values[timeOfDay],
      ),
    );

    element = createdElement;

    return createdElement;
  }

  void stateFunc(TasksBlocState state) {
    if (state is BlocError) {
      debugPrint(AppLocalizations.current.errorAdding);
    } else if (state is BlocSuccess) {
      Navigator.of(context).pop(element);
    }
  }

  void addTask() {
    final newTask = createElement();

    if (newTask != null) {
      bloc!.add(AddTaskEvent(task: newTask));
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
  void goBack() => Navigator.pop(context);
}
