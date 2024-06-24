import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers/api/service.dart';
import 'package:user/packages/model.dart';
import 'package:user/user/repo.dart';
import 'package:core/service.dart';

const String _email = 'admin@server.com';
const String _password = 'Test12345';
Future<String> get testDirectory async => (await Directory.systemTemp.createTemp('/')).path;

void main() {
  late UserRepository userRepo;
  late CoreService coreService;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    coreService = CoreService();
  });

  late String userId;
  test("- signin", () async {
    await userRepo.signIn(email: _email, password: _password);
    expect(userRepo.loggined, true);
  });

  group('Core ', () {
    test("- initialize", () async {
      coreService.initialize(location: await testDirectory);
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
    test("- economy add api", () async {
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
    test("- economy get api", () async {
      final resp = await coreService.getEconomyApi();
      economyId = resp[0].id.toString();
      expect(resp.isNotEmpty, true);
    });

    test("- economy delete api", () async {
      expect((await coreService.deleteEconomyApi(id: economyId)), true);
    });

    bool loggined = true;
    bool internet = true;

    test("- economy add without internet", () async {
      expect(
        await coreService.addEconomy(
          title: 'title',
          description: 'description',
          count: 1,
          date: 1,
          income: true,
          userId: '',
          loggined: false,
          internet: false,
        ),
        true,
      );
    });

    test("- economy add with internet", () async {
      expect(
        await coreService.addEconomy(
          title: 'title',
          description: 'description',
          count: 1,
          date: 1,
          income: true,
          userId: userId,
          loggined: false,
          internet: true,
        ),
        true,
      );
    });

    test("- economy get with internet", () async {
      final resp = await coreService.getEconomy(internet: false);
      expect(resp.isNotEmpty, true);
    });

    test("- economy get without internet", () async {
      final resp = await coreService.getEconomy(internet: internet);
      expect(resp.isNotEmpty, true);
    });

    test("- timer get api", () async {
      await coreService.timerGetApi();
    });

    test("- timer edit history api", () async {
      expect(
          (await coreService.timerEditHistoryApi(
            work: '1',
            relax: '1',
          )),
          true);
    });

    test("- timer edit stat api", () async {
      expect((await coreService.timerEditStatApi(timeWork: '1', timeRelax: '1')), true);
    });

    String taskId = '';

    test("- tasks get api", () async {
      final tasks = await coreService.getTasksApi();

      taskId = tasks.tasks[0].id;
    });
    test("- tasks add api", () async {
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

    test("- tasks edit api", () async {
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

    test("- delete api", () async {
      expect((await coreService.deleteTasksApi(taskId: taskId)), true);
    });
  });
}
