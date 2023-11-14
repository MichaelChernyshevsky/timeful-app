import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/economy/add_spending.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String apps = '/apps_screen';
  // static const String screen = '/screen';
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
        // screen: (_) => const Screen(),
        addSpendingScreen: (_) => const AddSpedingScreen(),
      };
}
