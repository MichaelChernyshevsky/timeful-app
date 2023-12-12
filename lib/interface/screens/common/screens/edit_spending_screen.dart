// ignore_for_file: must_be_immutable

import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSpendingScreen extends StatefulWidget {
  EditSpendingScreen({super.key, required this.element});

  EconomyElement element;

  @override
  State<EditSpendingScreen> createState() => _EditSpendingScreenState();
}

class _EditSpendingScreenState extends State<EditSpendingScreen> {
  EconomyBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<EconomyBloc>(context);
  }

  void onTapDelete() {
    bloc!.add(DeleteEconomyEvent(id: widget.element.id));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Body(
      appBar: AppBar(),
      widget: Column(
        children: [
          Text(AppLocalizations.current.pasteTitle),
          Text(AppLocalizations.current.description),
          CustomButton(
            color: UTILSConstants.undone,
            tap: onTapDelete,
            text: AppLocalizations.current.delete,
          ),
        ],
      ),
    );
  }
}
