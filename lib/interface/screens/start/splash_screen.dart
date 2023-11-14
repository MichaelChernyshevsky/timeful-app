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
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: _goToNext,
              child: SvgPicture.asset(
                'assets/money-bag-pixel-art_505135-55.jpg.svg',
                height: getHeight(100),
                width: getWidth(100),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(AppLocalizations.current.pressToContinue),
            ),
          ],
        ),
      ),
    );
  }
}
