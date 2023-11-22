import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter/material.dart';

class EditSpendingScreen extends StatefulWidget {
  EditSpendingScreen({super.key, required this.element});

  HistoryElement element;

  @override
  State<EditSpendingScreen> createState() => _EditSpendingScreenState();
}

class _EditSpendingScreenState extends State<EditSpendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Body(
      appBar: AppBar(),
      widget: Column(
        children: [
          Text(AppLocalizations.current.pasteTitle),
          Text(AppLocalizations.current.description),
        ],
      ),
    );
  }
}
