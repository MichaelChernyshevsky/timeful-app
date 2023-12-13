import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter/material.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  @override
  Widget build(BuildContext context) {
    return Body(widget: const Text('ggg'));
  }
}
