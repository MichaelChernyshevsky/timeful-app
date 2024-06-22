import 'package:helpers/parts/user/model.dart';

abstract class UserInterface {
  bool get loggined;
  int get userId;
  Future<UserModel?> get user;

  void signIn({required String email, required String password}) {}
  void signUp({required String email, required String password}) {}
  void signOut() {}

  void editUser({required int userId, required String name, required String sex, required String phone, required int age}) {}
  void deleteUser() {}
}
