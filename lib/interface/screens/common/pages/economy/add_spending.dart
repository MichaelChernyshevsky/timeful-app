import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController contorllerDescription = TextEditingController();

  HistoryElement? element;
  Color buttonColor = Colors.amber;
  bool currentDate = true;
  DateTime? date;

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
      description: contorllerDescription.text,
      date: date ?? DateTime.now(),
    );

    element = createdElement;

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

  void stateFunc(EconomyBlocState state) {
    if (state is BlocError) {
      debugPrint('error adding');
    } else if (state is BlocSuccess) {
      Navigator.of(context).pop(element);
    }
  }

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
            TextFormField(
              controller: contorllerCost,
              keyboardType: TextInputType.number,
            ),
            const Text('description'),
            TextFormField(
              controller: contorllerDescription,
              keyboardType: TextInputType.number,
            ),
            dateWidget(),
            BlocListener<EconomyBloc, EconomyBlocState>(
              listener: (context, state) => stateFunc(state),
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

  Column dateWidget() {
    void changeCheckBox({required bool newValue}) => setState(() {
          currentDate = newValue;
          if (newValue) {
            date = null;
          }
        });

    void setDate({required DateTime pickedDate}) => date = pickedDate;

    if (currentDate == true) {
      return Column(
        children: [
          Row(
            children: [
              const Text('Current date '),
              Checkbox(
                value: currentDate,
                onChanged: (value) => changeCheckBox(newValue: value!),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              const Text('Current date '),
              Checkbox(
                value: currentDate,
                onChanged: (value) => changeCheckBox(newValue: value!),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              minuteInterval: 30,
              initialDateTime: DateTime.now().add(
                Duration(minutes: 30 - DateTime.now().minute % 30),
              ),
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              onDateTimeChanged: (value) => setDate(
                pickedDate: value,
              ),
            ),
          ),
        ],
      );
    }
  }
}
