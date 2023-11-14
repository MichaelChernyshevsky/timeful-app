import 'package:app_with_apps/interface/exports/screens_exports.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<Object?> goToSignUp() =>
      Navigator.of(context).pushNamed(AppRoutes.singUpSCreen);

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
                controller: password,
                padding: getPadding(left: 40, right: 40),
              ),
              CustomButton(
                padding: getPadding(left: 100, right: 100, top: 40, bottom: 90),
                text: AppLocalizations.current.signIn,
                color: UTILSConstants.purple,
                tap: signIn,
              ),
              Padding(
                padding: getPadding(bottom: 25),
                child: GestureDetector(
                  onTap: goToSignUp,
                  child: CustomText(
                    text: AppLocalizations.current.signUp,
                    fontSize: TextEnum.bottom,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
