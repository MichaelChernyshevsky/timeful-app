@TestOn('vm')

library;

import 'package:economy/repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers/api/service.dart';
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

  setUpAll(() async {
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(httpService: httpService);
    economyRepo = EconomyRepository(httpService: httpService);
    timerRepo = TimerRepository(httpService: httpService);
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
        await economyRepo.add(title: 'title', description: 'description', count: 1, date: 1, income: 1, userId: userId),
        true,
      );
    });

    late String economyId;
    test("-  get", () async {
      final resp = await economyRepo.get(userId: userId);
      economyId = resp.models[0].id;
      expect(resp.models.isNotEmpty, true);
    });

    test("-  delete", () async {
      expect((await economyRepo.delete(id: economyId)), true);
    });
  });
  group('Timer ', () {
    test("-  get", () async {
      await timerRepo.get(userId: userId);
    });
    test("-  editHistory", () async {
      expect((await timerRepo.editHistory(userId: userId, work: '1', relax: '1')), true);
    });

    test("-  editStat", () async {
      expect((await timerRepo.editStat(userId: userId, timeWork: '', timeRelax: '')), true);
    });
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
        await coreService.economyAdd(
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
      final resp = await coreService.economyGet();
      economyId = resp.models[0].id;
      expect(resp.models.isNotEmpty, true);
    });

    test("- economy delete", () async {
      expect((await coreService.economyDelete(id: economyId)), true);
    });

    test("- timer get", () async {
      await coreService.timerGet();
    });

    test("- timer edit history", () async {
      expect(
          (await coreService.timerEditHistory(
            work: '1',
            relax: '1',
          )),
          true);
    });

    test("- timer edit stat", () async {
      expect((await coreService.timerEditStat(timeWork: '1', timeRelax: '1')), true);
    });
  });
}
