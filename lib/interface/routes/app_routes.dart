import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat_page.dart';
import 'package:app_with_apps/interface/screens/common/pages/timer_page.dart';
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

class PagesService {
  static List<Widget> get pages => [
        const StatPage(),
        // const NewsPage(),
        const TimerPage(),
        const TaskPage(),
        const EconomyPage(),
        const UserPage(),
      ];
}

class NavigationConstants {
  static List<IconData> get iconsBottomBar => [
        Icons.home_rounded,
        // Icons.home_rounded,
        Icons.timelapse,
        Icons.favorite_rounded,
        Icons.favorite_rounded,
        Icons.person_rounded,
      ];
  static List<String> get titlesBottomBar => [
        AppLocalizations.current.news,
        // AppLocalizations.current.news,
        AppLocalizations.current.timer,
        AppLocalizations.current.historyEconomy,
        AppLocalizations.current.historyEconomy,
        AppLocalizations.current.user,
      ];
}
