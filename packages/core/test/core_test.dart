@TestOn('vm')

library;

import 'package:core/service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers/parts/api/service.dart';
import 'package:helpers/parts/packages/model.dart';
import 'package:helpers/parts/packages/repo.dart';
import 'package:helpers/parts/user/repo.dart';

const String _email = 'admin@server.com';
const String _password = 'Test12345';

void main() {
  late UserRepository userRepo;
  late PackagesRepository packageRepo;
  late CoreService coreService;

  setUpAll(() async {
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(
      httpService: httpService,
    );
    coreService = CoreService();
  });

  tearDownAll(() {
    userRepo.signOut();
  });

  late String userId;
  group('Package ', () {
    test("- signin", () async {
      await userRepo.signIn(email: _email, password: _password);
      expect(userRepo.loggined, true);
    });

    test("- user", () async {
      final user = await userRepo.user;
      userId = user!.id;
    });

    test("- user edit", () async {
      final resp = await userRepo.editUser(userId: userRepo.userId, sex: '', name: '', phone: '', age: 21, name2: '');
      expect(resp, true);
      await userRepo.user;
    });
  });
  group('Package ', () {
    test("- package get", () async {
      final resp = await packageRepo.getPackages(userId: userId);
      expect(resp.userId, userRepo.userId);
    });

    test("- package change", () async {
      expect(await packageRepo.changePackage(type: PackageType.task, userId: userId), true);
    });

    test("- package info", () async {
      expect((await packageRepo.infoPackages()).packagees.isNotEmpty, true);
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
      final resp = await coreService.editUser(
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
      final resp = await coreService.getPackages();
      expect(resp.userId, userRepo.userId);
    });

    test("- package change", () async {
      expect(await coreService.changePackage(type: PackageType.task), true);
    });

    test("- package info", () async {
      expect((await coreService.infoPackages()).packagees.isNotEmpty, true);
    });
  });
}
