import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Body(
      widget: Column(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.user),
          SizedBox(
            height: h * 0.7,
            child: const Column(
              children: [
                Spacer(),
                // ProfileButton(onTap: () {}, color: Colors.red, title: AppLocalizations.current.exit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.title,
  });

  final VoidCallback onTap;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        width: w,
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.05),
          child: Text(
            title,
            style: TextStyle(fontSize: h * 0.04, color: color),
          ),
        ),
      ),
    );
  }
}
