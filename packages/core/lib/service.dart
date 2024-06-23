// ignore_for_file: depend_on_referenced_packages
import 'package:helpers/api/service.dart';
import 'package:user/packages/model.dart';
import 'package:user/packages/repo.dart';
import 'package:user/user/repo.dart';
import 'package:economy/repo.dart';
import 'package:economy/model.dart';
import 'package:timer/repo.dart';
import 'package:timer/model.dart';

class CoreService {
  late UserRepository userRepo;
  late PackagesRepository packageRepo;
  late EconomyRepository economyRepo;
  late TimerRepository timerRepo;

  void initialize() {
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(httpService: httpService);
    economyRepo = EconomyRepository(httpService: httpService);
    timerRepo = TimerRepository(httpService: httpService);
  }

  // User
  Future<bool> userEdit({
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

  Future get user async => userRepo.user;

  Future signIn({
    required String email,
    required String password,
  }) async =>
      userRepo.signIn(
        email: email,
        password: password,
      );

  void signOut() => userRepo.signOut();

  void userDelete() => userRepo.deleteUser();

  void signUp({required String email, required String password}) => userRepo.signUp(email: email, password: password);

  bool get loggined => userRepo.loggined;

  String get userId => userRepo.userId;

  // Package
  Future<bool> packageChange({required PackageType type}) async => packageRepo.changePackage(type: type, userId: userRepo.userId);

  Future<Packages> packageGet() async => packageRepo.getPackages(userId: userRepo.userId);

  Future<PackagesInfo> packageInfo() async => packageRepo.infoPackages();

  // Economy
  Future<bool> economyAdd({
    required String title,
    required String description,
    required int count,
    required int date,
    required int income,
  }) =>
      economyRepo.add(
        title: title,
        description: description,
        count: count,
        date: date,
        income: income,
        userId: userId,
      );

  Future<bool> economyDelete({required String id}) => economyRepo.delete(id: id);

  Future<EconomyModels> economyGet() => economyRepo.get(userId: userId);

  // Timer
  Future<bool> timerEditHistory({
    required String work,
    required String relax,
  }) =>
      timerRepo.editHistory(
        userId: userId,
        work: work,
        relax: relax,
      );

  Future<bool> timerEditStat({
    required String timeWork,
    required String timeRelax,
  }) =>
      timerRepo.editStat(
        userId: userId,
        timeWork: timeWork,
        timeRelax: timeRelax,
      );

  Future<TimerModel1> timerGet() => timerRepo.get(userId: userId);
}
