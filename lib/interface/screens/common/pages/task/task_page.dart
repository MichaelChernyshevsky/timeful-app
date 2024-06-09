import 'package:app_with_apps/interface/exports/screens_exports.dart';

import 'package:app_with_apps/core/manager/tasks_bloc/tasks_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/common/pages/task/widgets/widgets_task.dart';
import 'package:app_with_apps/interface/screens/common/pages/task/create/create_task_screen.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskModel> tasks = [];
  bool loading = true;
  TasksBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<TasksBloc>(context);
    bloc!.add(GetTasksEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc!.add(DisposeEvent());
    super.dispose();
  }

  Future goToCreate() async {
    final task = await Navigator.push(
      context,
      MaterialPageRoute(builder: CreateTaskScreen.builder),
    );

    if (task != null) {
      setState(
        () => tasks.add(task),
      );
    }
  }

  void onError() => debugPrint(AppLocalizations.current.errorLoading);

  void setElements(List<TaskModel> elementsBloc) => setState(() {
        tasks = elementsBloc;
        loading = false;
      });

  void changeTaskState({required id, required isDone}) {}

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Body(
      widget: Stack(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.tasks),
          Padding(
            padding: EdgeInsets.only(top: h * 0.09),
            child: SizedBox(
              width: w * 0.8,
              child: BlocListener<TasksBloc, TasksBlocState>(
                listener: (context, state) {
                  if (state is BlocError) {
                    onError();
                  } else if (state is GetTasksSuccess) {
                    setElements(state.tasks);
                  }
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final task in tasks) TaskWidget(element: task),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.75),
            child: GestureDetector(
              onTap: goToCreate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    color: Colors.green,
                    height: h * 0.07,
                    width: w * 0.8,
                    widget: Center(
                      child: CustomText(text: AppLocalizations.current.addTask),
                    ),
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
