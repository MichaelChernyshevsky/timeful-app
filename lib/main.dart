import 'package:app_with_apps/core/data/hive/economy_repo.dart';
import 'package:app_with_apps/core/data/hive/task_repo.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/core/manager/get.it/app_provider.dart';
import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/core/manager/provider/ordinaryProvider.dart';
import 'package:app_with_apps/core/manager/tasks_bloc/tasks_bloc.dart';
import 'package:app_with_apps/core/service/notification_service.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/interface/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();

  await Hive.initFlutter();

  GetIt.I.registerSingleton<AppProvider>(AppProvider());
  GetIt.I.registerSingleton<StatProvider>(StatProvider());

  GetIt.I.registerSingletonAsync<TaskRepo>(
    () async {
      final hivePacks = TaskRepo();
      await hivePacks.init();
      return hivePacks;
    },
  );

  GetIt.I.registerSingletonAsync<EconomyRepo>(
    () async {
      final hivePacks = EconomyRepo();
      await hivePacks.init();
      return hivePacks;
    },
  );

  await GetIt.I.allReady();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<EconomyBloc>(create: (context) => EconomyBloc()),
        BlocProvider<TasksBloc>(create: (context) => TasksBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OrdinaryProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: UTILSConstants.purple,
          brightness: Brightness.dark,
        ),
      ),
      title: AppLocalizations.current.empty,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
