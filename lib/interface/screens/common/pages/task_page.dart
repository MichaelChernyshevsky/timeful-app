import 'package:app_with_apps/core/manager/tasks_bloc/tasks_bloc.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets_task.dart';
import 'package:app_with_apps/interface/screens/common/screens/create_task_screen.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskElement> tasks = [];
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

  void setElements(List<TaskElement> elementsBloc) => setState(() {
        tasks = elementsBloc;
        loading = false;
      });

  void changeTaskState({required id, required isDone}) {}

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CustomContainer(
              //   color: UTILSConstants.black,
              //   widget: const Row(),
              // ),
              CustomButton(
                color: UTILSConstants.white,
                text: AppLocalizations.current.add,
                tap: goToCreate,
              ),
            ],
          ),
          SizedBox(
            height: getHeight(620),
            child: BlocListener<TasksBloc, TasksBlocState>(
              listener: (context, state) {
                if (state is BlocError) {
                  onError();
                } else if (state is GetTasksSuccess) {
                  setElements(state.tasks);
                }
              },
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(element: tasks[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
