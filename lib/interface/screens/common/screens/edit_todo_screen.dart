import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter/material.dart';

class EditToDoScreen extends StatefulWidget {
  EditToDoScreen({super.key, required this.element});

  TaskElement element;

  @override
  State<EditToDoScreen> createState() => _EditToDoScreenState();
}

class _EditToDoScreenState extends State<EditToDoScreen> {
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
