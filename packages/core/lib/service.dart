// ignore_for_file: depend_on_referenced_packages

import 'package:helpers/parts/api/service.dart';
import 'package:helpers/parts/packages/model.dart';
import 'package:helpers/parts/packages/repo.dart';
import 'package:helpers/parts/user/repo.dart';
import 'package:helpers/parts/api/models/base_response.dart';
import 'package:helpers/parts/user/model.dart';

class CoreService {
  late UserRepository userRepo;
  late PackagesRepository packageRepo;

  void initialize() {
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(httpService: httpService);
  }

  // User
  Future<bool> editUser({
    String? name,
    String? name2,
    String? sex,
    String? phone,
    int? age,
  }) async =>
      userRepo.editUser(
        userId: userId,
        name: name,
        name2: name2,
        sex: sex,
        phone: phone,
        age: age,
      );

  Future<UserModel?> get user async => userRepo.user;

  Future<BaseResponse> signIn({
    required String email,
    required String password,
  }) async =>
      userRepo.signIn(
        email: email,
        password: password,
      );

  void signOut() => userRepo.signOut();

  void deleteUser() => userRepo.deleteUser();

  void signUp({required String email, required String password}) => userRepo.signUp(email: email, password: password);

  bool get loggined => userRepo.loggined;

  String get userId => userRepo.userId;

  // Package
  Future<bool> changePackage({required PackageType type}) async => packageRepo.changePackage(type: type, userId: userRepo.userId);

  Future<Packages> getPackages() async => packageRepo.getPackages(userId: userRepo.userId);

  Future<PackagesInfo> infoPackages() async => packageRepo.infoPackages();
}
