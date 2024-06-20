import 'package:helpers/common/templates/repository.dart';
import 'package:helpers/parts/user/interface/packages.dart';
import 'package:helpers/parts/user/interface/user.dart';

import 'package:helpers/parts/user/models/user.dart';

class UserRepository extends Repository implements UserInterface, PackagesInterface {
  UserRepository({required super.httpService});

  @override
  void addPackage() {
    // TODO: implement addPackage
  }

  @override
  void deletePackages() {
    // TODO: implement deletePackages
  }

  @override
  void deleteUser() {
    // TODO: implement deleteUser
  }

  @override
  void editUser() {
    // TODO: implement editUser
  }

  @override
  void getPackages() {
    // TODO: implement getPackages
  }

  @override
  void getUser() {
    // TODO: implement getUser
  }

  @override
  void signIn() {
    // TODO: implement signIn
  }

  @override
  void signOut() {
    // TODO: implement signOut
  }

  @override
  void signUp() {
    // TODO: implement signUp
  }

  @override
  // TODO: implement loggined
  bool get loggined => throw UnimplementedError();

  @override
  // TODO: implement userId
  int get userId => throw UnimplementedError();
}
