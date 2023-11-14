import 'package:app_with_apps/interface/exports/screens_exports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password_1 = TextEditingController();
  final TextEditingController password_2 = TextEditingController();

  Future<Object?> goToSignIp() =>
      Navigator.of(context).popAndPushNamed(AppRoutes.signInScreen);

  Future<Object?> goNext() =>
      Navigator.of(context).popAndPushNamed(AppRoutes.setUserScreen);

  void signIn() => print(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextField(
                controller: email,
                padding: getPadding(top: 23, bottom: 15, left: 40, right: 40),
              ),
              CustomTextField(
                controller: password_1,
                padding: getPadding(
                  left: 40,
                  right: 40,
                  bottom: 15,
                ),
              ),
              CustomTextField(
                controller: password_2,
                padding: getPadding(
                  left: 40,
                  right: 40,
                  bottom: 94,
                ),
              ),
              BottomText(
                text_1: AppLocalizations.current.signIn,
                text_2: AppLocalizations.current.signUp,
                tap_1: goToSignIp,
                tap_2: goNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
