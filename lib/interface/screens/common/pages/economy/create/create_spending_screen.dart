import 'package:app_with_apps/interface/func/uuid.dart';
import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
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
  EconomyModel? element;
  Color buttonColor = UTILSConstants.purple;
  bool currentDate = true;
  DateTime? date;
  bool isSpending = true;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    super.initState();
  }

  EconomyModel? createElement() {
    if (contorllerTitle.text.isEmpty) {
      return null;
    }
    if (contorllerCost.text.isEmpty) {
      return null;
    }
    final createdElement = EconomyModel(
      id: getUUID(),
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
      bloc!.add(AddEconoomyEvent(element: element));
    } else {
      setState(() {
        buttonColor = UTILSConstants.grey1;
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
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Body(
      widget: Column(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.addSpending, onTap: goBack),
          Padding(
            padding: getPadding(top: h * 0.03),
            child: Column(
              children: [
                Text(AppLocalizations.current.pasteTitle),
                Padding(
                  padding: getPadding(top: h * 0.01, bottom: h * 0.01),
                  child: TextFormField(
                    controller: contorllerTitle,
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
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: h * 0.03),
            child: Column(
              children: [
                Text(AppLocalizations.current.pasteCount),
                Padding(
                  padding: getPadding(top: h * 0.01, bottom: h * 0.01),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: contorllerCost,
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
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: h * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CustomButton(
                //   text: ,
                //   tap: onTapSpending,
                // ),
                GestureDetector(
                  onTap: onTapSpending,
                  child: CustomContainer(
                    color: isSpending == true ? UTILSConstants.pink : UTILSConstants.grey1,
                    colorBorder: UTILSConstants.pink,
                    widget: Center(
                      child: Text(AppLocalizations.current.isSpending, style: TextStyle(fontSize: h * 0.03)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTapIncome,
                  child: CustomContainer(
                    color: isSpending == false ? UTILSConstants.pink : UTILSConstants.grey1,
                    colorBorder: UTILSConstants.pink,
                    widget: Center(
                      child: Text(AppLocalizations.current.isIncome, style: TextStyle(fontSize: h * 0.03)),
                    ),
                  ),
                ),
                // CustomButton(
                //   colorBorder: UTILSConstants.pink,
                //   color: isSpending == false ? UTILSConstants.pink : UTILSConstants.grey1,
                //   text: AppLocalizations.current.isIncome,
                //   tap: onTapIncome,
                // ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: h * 0.03),
            child: Column(
              children: [
                Text(AppLocalizations.current.description),
                Padding(
                  padding: getPadding(top: h * 0.01, bottom: h * 0.01),
                  child: TextFormField(
                    controller: contorllerDescription,
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
              ],
            ),
          ),
          dateWidget(),
          const Spacer(),
          BlocListener<EconomyBloc, EconomyBlocState>(
            listener: (context, state) => stateFunc(state),
            child: CustomButton(
              color: UTILSConstants.pink,
              tap: addSpending,
              text: AppLocalizations.current.add,
            ),
          ),
        ],
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

  void goBack() => Navigator.pop(context);
}
