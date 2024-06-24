@TestOn('vm')

library;

import 'package:economy/repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers/api/service.dart';
import 'package:tasks/tasks.dart';
import 'package:timer/repo.dart';
import 'package:user/packages/model.dart';
import 'package:user/packages/repo.dart';
import 'package:user/user/repo.dart';
import 'package:core/service.dart';

const String _email = 'admin@server.com';
const String _password = 'Test12345';

void main() {
  late UserRepository userRepo;
  late PackagesRepository packageRepo;
  late CoreService coreService;
  late EconomyRepository economyRepo;
  late TimerRepository timerRepo;
  late TaskRepository taskRepo;

  setUpAll(() async {
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(httpService: httpService);
    economyRepo = EconomyRepository(httpService: httpService);
    timerRepo = TimerRepository(httpService: httpService);
    taskRepo = TaskRepository(httpService: httpService);
    coreService = CoreService();
  });

  tearDownAll(() {
    userRepo.signOut();
  });

  late String userId;
  group('User ', () {
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
  group('Package ', () {
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
  group('Economy ', () {
    test("-  add", () async {
      expect(
        await economyRepo.addEconomyApi(title: 'title', description: 'description', count: 1, date: 1, income: 1, userId: userId),
        true,
      );
    });

    late String economyId;
    test("-  get", () async {
      final resp = await economyRepo.getEconomyApi(userId: userId);
      economyId = resp.models[0].id;
      expect(resp.models.isNotEmpty, true);
    });

    test("-  delete", () async {
      expect((await economyRepo.deleteEconomyApi(id: economyId)), true);
    });
  });
  group('Timer ', () {
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

  group('Taks ', () {
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

  group('Core ', () {
    test("- initialize", () async {
      coreService.initialize();
    });

    test("- signin", () async {
      await coreService.signIn(email: _email, password: _password);
      expect(userRepo.loggined, true);
    });

    test("- user", () async {
      final user = await coreService.user;
      userId = user!.id;
    });

    test("- user edit", () async {
      final resp = await coreService.userEdit(
        sex: '',
        name: '',
        phone: '',
        age: 21,
        name2: '',
      );
      expect(resp, true);
      await userRepo.user;
    });

    test("- package get", () async {
      final resp = await coreService.packageGet();
      expect(resp.userId, userRepo.userId);
    });

    test("- package change", () async {
      expect(await coreService.packageChange(type: PackageType.task), true);
    });

    test("- package info", () async {
      expect((await coreService.packageInfo()).packagees.isNotEmpty, true);
    });
    test("- economy add", () async {
      expect(
        await coreService.addEconomyApi(
          title: 'title',
          description: 'description',
          count: 1,
          date: 1,
          income: 1,
        ),
        true,
      );
    });

    late String economyId;
    test("- economy get", () async {
      final resp = await coreService.getEconomyApi();
      economyId = resp.models[0].id;
      expect(resp.models.isNotEmpty, true);
    });

    test("- economy delete", () async {
      expect((await coreService.deleteEconomyApi(id: economyId)), true);
    });

    test("- timer get", () async {
      await coreService.timerGetApi();
    });

    test("- timer edit history", () async {
      expect(
          (await coreService.timerEditHistoryApi(
            work: '1',
            relax: '1',
          )),
          true);
    });

    test("- timer edit stat", () async {
      expect((await coreService.timerEditStatApi(timeWork: '1', timeRelax: '1')), true);
    });

    String taskId = '';

    test("- tasks get", () async {
      final tasks = await coreService.getTasksApi();

      taskId = tasks.tasks[0].id;
    });
    test("- tasks add", () async {
      expect(
          (await coreService.addTasksApi(
            title: '2',
            description: '2',
            date: '2',
            countOnDay: '0',
            countOnTask: '0',
          )),
          true);
    });

    test("- tasks edit", () async {
      expect(
          (await coreService.editTasksApi(
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
      expect((await coreService.deleteTasksApi(taskId: taskId)), true);
    });
  });
}
