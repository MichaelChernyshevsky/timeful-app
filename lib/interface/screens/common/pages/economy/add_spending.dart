import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSpedingScreen extends StatefulWidget {
  const AddSpedingScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<EconomyBloc>(
      create: (context) => EconomyBloc(),
      child: const AddSpedingScreen(),
    );
  }

  @override
  State<AddSpedingScreen> createState() => _AddSpedingScreenState();
}

class _AddSpedingScreenState extends State<AddSpedingScreen> {
  EconomyBloc? bloc;
  TextEditingController contorllerTitle = TextEditingController();
  TextEditingController contorllerCost = TextEditingController();
  HistoryElement? element;
  Color buttonColor = Colors.amber;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    super.initState();
  }

  HistoryElement? createElement() {
    if (contorllerTitle.text.isEmpty) {
      return null;
    }
    if (contorllerCost.text.isEmpty) {
      return null;
    }
    final createdElement = HistoryElement(
      title: contorllerTitle.text,
      count: int.parse(contorllerCost.text),
    );

    setState(() {
      element = createdElement;
    });

    return createdElement;
  }

  void addSpending() {
    final element = createElement();
    if (element != null) {
      bloc!.add(
        AddSpending(element: element),
      );
    } else {
      setState(() {
        buttonColor = Colors.red;
      });
    }
  }

  void goBack() {
    Navigator.of(context).pop(element);
  }

  void onError() => debugPrint('error adding');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.current.addSpending,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('paste title'),
            TextFormField(controller: contorllerTitle),
            const Text('paste count'),
            TextFormField(controller: contorllerCost),
            BlocListener<EconomyBloc, EconomyBlocState>(
              listener: (context, state) {
                if (state is BlocError) {
                  onError();
                } else if (state is BlocSuccess) {
                  goBack();
                }
              },
              child: CustomButton(
                color: Colors.amber,
                tap: addSpending,
                text: AppLocalizations.current.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
