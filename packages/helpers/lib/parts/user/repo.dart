import 'package:helpers/common/templates/repository.dart';
import 'package:helpers/parts/auth/models/auth_service.dart';
import 'package:helpers/parts/user/models/user.dart';

class UserRepository extends Repository {
  UserRepository({required super.httpService, required this.authService});

  final AuthService authService;

  bool get loggined => authService.userId != 0;

  int get userId => authService.userId;

  Future<UserModel> getUserInfo() async {
    // final resp = await httpService.get(userInfo());
    // return UserModel.fromJson(resp.data);
    return UserModel();
  }
}
