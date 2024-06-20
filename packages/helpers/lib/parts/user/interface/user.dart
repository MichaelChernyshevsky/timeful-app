import 'package:helpers/parts/user/models/user.dart';

abstract class UserInterface {
  bool get loggined;
  int get userId;

  void signIn() {}
  void signUp() {}
  void signOut() {}

  void getUser() {}
  void editUser() {}
  void deleteUser() {}
}
