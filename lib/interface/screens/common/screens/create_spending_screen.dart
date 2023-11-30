import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateSpedingScreen extends StatefulWidget {
  const CreateSpedingScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<EconomyBloc>(
      create: (context) => EconomyBloc(),
      child: const CreateSpedingScreen(),
    );
  }

  @override
  State<CreateSpedingScreen> createState() => _CreateSpedingScreenState();
}

class _CreateSpedingScreenState extends State<CreateSpedingScreen> {
  EconomyBloc? bloc;
  TextEditingController contorllerTitle = TextEditingController();
  TextEditingController contorllerCost = TextEditingController();
  TextEditingController contorllerDescription = TextEditingController();
  EconomyElement? element;
  Color buttonColor = UTILSConstants.purple;
  bool currentDate = true;
  DateTime? date;
  bool isSpending = true;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    super.initState();
  }

  EconomyElement? createElement() {
    if (contorllerTitle.text.isEmpty) {
      return null;
    }
    if (contorllerCost.text.isEmpty) {
      return null;
    }
    final createdElement = EconomyElement(
      id: 0,
      title: contorllerTitle.text,
      count: int.parse(contorllerCost.text),
      description: contorllerDescription.text,
      date: date ?? DateTime.now(),
      isSpending: isSpending,
    );

    element = createdElement;

    return createdElement;
  }

  void addSpending() {
    final element = createElement();
    if (element != null) {
      bloc!.add(
        AddSpendingEvent(element: element),
      );
    } else {
      setState(() {
        buttonColor = UTILSConstants.grey;
      });
    }
  }

  void stateFunc(EconomyBlocState state) {
    if (state is BlocError) {
      debugPrint(AppLocalizations.current.errorAdding);
    } else if (state is BlocSuccess) {
      Navigator.of(context).pop(element);
    }
  }

  void onTapSpending() => setState(() {
        isSpending = true;
      });

  void onTapIncome() => setState(() {
        isSpending = false;
      });

  @override
  Widget build(BuildContext context) {
    return Body(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.current.addSpending,
        ),
      ),
      widget: Center(
        child: Column(
          children: [
            Text(AppLocalizations.current.pasteTitle),
            TextFormField(controller: contorllerTitle),
            Text(AppLocalizations.current.pasteCount),
            TextFormField(
              controller: contorllerCost,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: getPadding(all: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    color: isSpending == true
                        ? UTILSConstants.purple
                        : UTILSConstants.white,
                    text: AppLocalizations.current.isSpending,
                    tap: onTapSpending,
                  ),
                  CustomButton(
                    color: isSpending == false
                        ? UTILSConstants.purple
                        : UTILSConstants.white,
                    text: AppLocalizations.current.isIncome,
                    tap: onTapIncome,
                  ),
                ],
              ),
            ),
            Text(AppLocalizations.current.description),
            TextFormField(
              controller: contorllerDescription,
            ),
            dateWidget(),
            BlocListener<EconomyBloc, EconomyBlocState>(
              listener: (context, state) => stateFunc(state),
              child: CustomButton(
                color: UTILSConstants.purple,
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
              Text(AppLocalizations.current.currentDate),
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
              Text(AppLocalizations.current.currentDate),
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
