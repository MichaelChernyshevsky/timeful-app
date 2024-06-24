// ignore_for_file: depend_on_referenced_packages

import 'core.dart';

class CoreService {
  late UserRepository userRepo;
  late PackagesRepository packageRepo;
  late EconomyRepository economyRepo;
  late TimerRepository timerRepo;
  late TaskRepository taskRepo;

  void initialize() {
    final httpService = DioHttpService(baseUrl: 'http://127.0.0.1:5000');
    userRepo = UserRepository(httpService: httpService);
    packageRepo = PackagesRepository(httpService: httpService);
    economyRepo = EconomyRepository(httpService: httpService);
    timerRepo = TimerRepository(httpService: httpService);
    taskRepo = TaskRepository(httpService: httpService);

    economyRepo.init();
    timerRepo.init();
    taskRepo.init();
  }

  void refresh() {
    economyRepo.refresh(userId: userId);
    timerRepo.refresh(userId: userId);
    taskRepo.refresh(userId: userId);
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //  User
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
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
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //   Package
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  Future<bool> packageChange({required PackageType type}) async => packageRepo.changePackage(type: type, userId: userRepo.userId);

  Future<Packages> packageGet() async => packageRepo.getPackages(userId: userRepo.userId);

  Future<PackagesInfo> packageInfo() async => packageRepo.infoPackages();
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //  Economy
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  Future<bool> deleteEconomy({required String id}) async {
    return true;
  }

  Future<bool> addEconomy({required EconomyModel element}) async {
    return true;
  }

  Future<EconomyModels> getEconomy() async {
    return EconomyModels(models: []);
  }

  Future<bool> wipeEconomy() async {
    return true;
  }

  Future<bool> addEconomyApi({
    required String title,
    required String description,
    required int count,
    required int date,
    required int income,
  }) =>
      economyRepo.addEconomyApi(
        title: title,
        description: description,
        count: count,
        date: date,
        income: income,
        userId: userId,
      );

  Future<bool> deleteEconomyApi({required String id}) => economyRepo.deleteEconomyApi(id: id);

  Future<EconomyModels> getEconomyApi() => economyRepo.getEconomyApi(userId: userId);
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //  Timer
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  Future<bool> timerEditHistoryApi({
    required String work,
    required String relax,
  }) =>
      timerRepo.editTimerHistoryApi(
        userId: userId,
        work: work,
        relax: relax,
      );

  Future<bool> timerEditStatApi({
    required String timeWork,
    required String timeRelax,
  }) =>
      timerRepo.editTimerStatApi(
        userId: userId,
        timeWork: timeWork,
        timeRelax: timeRelax,
      );

  Future<TimerModel1> timerGetApi() => timerRepo.getTimerApi(userId: userId);
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //  Tasks
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  Future<bool> deleteTasks({required String id}) async {
    return true;
  }

  Future<bool> addTasks({required TaskModel element}) async {
    return true;
  }

  Future<TasksModels> getTasks() async {
    return TasksModels([]);
  }

  Future<bool> tasksWipe() async {
    return true;
  }

  Future<bool> addTasksApi({
    required String title,
    required String description,
    required String date,
    required String countOnDay,
    required String countOnTask,
  }) async =>
      taskRepo.addTasksApi(
        userId: userId,
        title: title,
        description: description,
        date: date,
        countOnDay: countOnDay,
        countOnTask: countOnTask,
      );

  Future<bool> deleteTasksApi({
    required String taskId,
  }) async =>
      taskRepo.deleteTasksApi(
        taskId: taskId,
      );

  Future<bool> editTasksApi({
    required String taskId,
    required String title,
    required String description,
    required String date,
    required String countOnDay,
    required String countOnTask,
  }) async =>
      taskRepo.editTasksApi(
        taskId: taskId,
        title: title,
        description: description,
        date: date,
        countOnDay: countOnDay,
        countOnTask: countOnTask,
      );

  Future<TasksModels> getTasksApi() async => taskRepo.getTasksApi(userId: userId);
}
