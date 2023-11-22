import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/screens/create_spending_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String apps = '/apps_screen';
  static const String signInScreen = '/signIn_screen';
  static const String singUpSCreen = '/signUp_screen';
  static const String setUserScreen = '/setUser_screen';
  static const String addSpendingScreen = '/addSpendingScreen';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (_) => const SplashScreen(),
        signInScreen: (_) => const SignInScreen(),
        singUpSCreen: (_) => const SignUpScreen(),
        setUserScreen: (_) => const SetUserScreen(),
        apps: (_) => const MainScreen(),
        addSpendingScreen: (_) => const CreateSpedingScreen(),
      };
}
