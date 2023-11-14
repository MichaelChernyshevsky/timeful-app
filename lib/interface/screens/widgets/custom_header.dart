import 'package:app_with_apps/interface/exports/screens_exports.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Text(
          title,
        ),
      ),
    );
  }
}
