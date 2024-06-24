@TestOn('vm')

library;

import 'package:economy/economy.dart';
import 'package:economy/repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers/api/service.dart';
import 'package:tasks/tasks.dart';
import 'package:timer/repo.dart';
import 'package:user/packages/model.dart';
import 'package:user/packages/repo.dart';
import 'package:user/user/repo.dart';

const String _email = 'admin@server.com';
const String _password = 'Test12345';
Future<String> get testDirectory async => (await Directory.systemTemp.createTemp('/')).path;

void main() {
  late UserRepository userRepo;
  late PackagesRepository packageRepo;
  late EconomyRepository economyRepo;
  late TimerRepository timerRepo;
  late TaskRepository taskRepo;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(httpService: httpService);
    economyRepo = EconomyRepository(httpService: httpService);
    timerRepo = TimerRepository(httpService: httpService);
    taskRepo = TaskRepository(httpService: httpService);
  });

  tearDownAll(() async {
    await economyRepo.close();
  });

  late String userId;
  group('User Api', () {
    test("- signin", () async {
      await userRepo.signIn(email: _email, password: _password);
      expect(userRepo.loggined, true);
    });

    test("- user", () async {
      final user = await userRepo.user;
      userId = user!.id;
    });

    test("-  edit", () async {
      final resp = await userRepo.editUser(userId: userRepo.userId, sex: '', name: '', phone: '', age: 21, name2: '');
      expect(resp, true);
      await userRepo.user;
    });
  });
  group('Package Api', () {
    test("-  get", () async {
      final resp = await packageRepo.getPackages(userId: userId);
      expect(resp.userId, userRepo.userId);
    });

    test("-  change", () async {
      expect(await packageRepo.changePackage(type: PackageType.task, userId: userId), true);
    });

    test("-  info", () async {
      expect((await packageRepo.infoPackages()).packagees.isNotEmpty, true);
    });
  });

  group('Economy Api', () {
    test("-  add", () async {
      expect(
        await economyRepo.addEconomyApi(title: 'title', description: 'description', count: 1, date: 1, income: 1, userId: userId),
        true,
      );
    });

    late String economyId;
    test("-  get", () async {
      final resp = await economyRepo.getEconomyApi(userId: userId);
      economyId = resp[0].id.toString();
      expect(resp.isNotEmpty, true);
    });

    test("-  delete", () async {
      expect((await economyRepo.deleteEconomyApi(id: economyId)), true);
    });
  });

  bool loggined = false;
  String userId0 = '0';
  bool internet = false;

  test(
    "Economy -  initialize",
    () async => await economyRepo.initialize(
      internet: internet,
      loggined: loggined,
      userId: userId0,
      location: await testDirectory,
    ),
  );

  group('Economy isar without login', () {
    test("-  add", () async {
      expect(
        await economyRepo.addEconomy(
          title: 'title',
          description: 'description',
          count: 1,
          date: 1,
          income: true,
          userId: userId0,
          loggined: loggined,
          internet: internet,
        ),
        true,
      );
    });

    late int economyId;
    test("-  get", () async {
      final resp = await economyRepo.getEconomy(userId: userId0, loggined: loggined, internet: internet);
      economyId = resp[0].id;
      expect(resp.isNotEmpty, true);
    });

    test("-  delete", () async {
      expect(
          (await economyRepo.deleteEconomy(
            id: economyId,
            loggined: loggined,
            internet: internet,
          )),
          true);
    });
  });
  group('Economy isar with login', () {
    bool loggined = true;
    bool internet = true;

    test("-  add without internet", () async {
      expect(
        await economyRepo.addEconomy(
          title: 'without',
          description: 'description',
          count: 1,
          date: 1,
          income: true,
          userId: userId,
          loggined: false,
          internet: false,
        ),
        true,
      );
    });

    test("-  add with internet", () async {
      expect(
        await economyRepo.addEconomy(
          title: 'with',
          description: 'description',
          count: 1,
          date: 1,
          income: true,
          userId: userId,
          loggined: loggined,
          internet: internet,
        ),
        true,
      );
    });
    late int economyId;
    test("-  get ", () async {
      final resp = await economyRepo.getEconomy(userId: userId, loggined: loggined, internet: internet);
      economyId = resp[0].id;
      expect(resp.isNotEmpty, true);
    });

    test("-  delete", () async {
      expect(
          (await economyRepo.deleteEconomy(
            id: economyId,
            loggined: loggined,
            internet: internet,
          )),
          true);
    });
  });

  group('Timer Api', () {
    test("-  get", () async {
      await timerRepo.getTimerApi(userId: userId);
    });
    test("-  editHistory", () async {
      expect((await timerRepo.editTimerHistoryApi(userId: userId, work: '1', relax: '1')), true);
    });

    test("-  editStat", () async {
      expect((await timerRepo.editTimerStatApi(userId: userId, timeWork: '', timeRelax: '')), true);
    });
  });
  group('Taks Api', () {
    String taskId = '';
    test("-  get", () async {
      final tasks = await taskRepo.getTasksApi(userId: userId);

      taskId = tasks.tasks[0].id;
    });

    test("-  add", () async {
      expect(
          (await taskRepo.addTasksApi(
            userId: userId,
            title: '2',
            description: '2',
            date: '2',
            countOnDay: '0',
            countOnTask: '0',
          )),
          true);
    });

    test("-  edit", () async {
      expect(
          (await taskRepo.editTasksApi(
            taskId: userId,
            title: '1',
            description: '1',
            date: '0',
            countOnDay: '1',
            countOnTask: '1',
          )),
          true);
    });

    test("-  delete", () async {
      expect((await taskRepo.deleteTasksApi(taskId: taskId)), true);
    });

    // test("-  editStat", () async {
    //   expect((await taskRepo.statEditTasks(userId: userId, countDone: '20', countUnDone: '20')), true);
    // });
  });
}
