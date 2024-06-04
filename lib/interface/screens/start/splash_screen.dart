import 'package:app_with_apps/interface/exports/screens_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goToNext() {
    if (GetIt.I.get<AppProvider>().loggined) {
      Navigator.of(context).popAndPushNamed(AppRoutes.apps);
    } else {
      Navigator.of(context).popAndPushNamed(AppRoutes.signInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _goToNext,
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Text(AppLocalizations.current.appName),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(AppLocalizations.current.pressToContinue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
