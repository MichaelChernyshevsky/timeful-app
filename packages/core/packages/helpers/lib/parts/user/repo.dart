import 'package:helpers/common/templates/repository.dart';
import 'package:helpers/helpers.dart';
import 'package:helpers/parts/api/state.dart';
import 'package:helpers/parts/user/interface.dart';
import 'package:helpers/parts/user/uri.dart';

import 'package:helpers/parts/user/model.dart';

class UserRepository extends Repository implements UserInterface {
  UserRepository({required super.httpService});

  String? _userId;

  @override
  Future<bool> editUser({required String userId, String? name, String? name2, String? sex, String? phone, int? age}) async {
    final BaseResponse resp = await httpService.patch(
      editUserUri,
      data: {"userId": userId, "name": name, "sex": sex, "phone": phone, "age": age, "name2": name2},
    );
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<UserModel?> get user async {
    final BaseResponse resp = await httpService.post(infoUserUri, data: {
      "userId": userId,
    });
    return resp.message == MESSAGE_SUCCESS ? UserModel.fromJson(resp.data) : null;
  }

  @override
  Future<BaseResponse> signIn({required String email, required String password}) async {
    final BaseResponse resp = await httpService.post(signInUri, data: {
      "email": email,
      "password": password,
    });

    _userId = resp.data['userId'].toString();
    return resp;
  }

  @override
  void signOut() {}

  @override
  void deleteUser() {}

  @override
  void signUp({required String email, required String password}) {}

  @override
  bool get loggined => _userId != '0';

  @override
  String get userId => _userId ?? '0';
}
