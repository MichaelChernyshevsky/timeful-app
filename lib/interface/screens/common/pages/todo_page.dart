import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/create_task.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<dynamic> tasks = [];

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

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomContainer(
                color: UTILSConstants.black,
                widget: const Row(),
              ),
              CustomButton(
                color: UTILSConstants.white,
                text: AppLocalizations.current.add,
                tap: goToCreate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
