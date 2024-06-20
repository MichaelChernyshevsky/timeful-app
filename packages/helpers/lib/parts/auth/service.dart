// ignore_for_file: unused_catch_stack

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:helpers/common/templates/api.dart';
import 'package:helpers/parts/auth/models/auth_exception.dart';
import 'package:helpers/parts/auth/models/auth_service.dart';

class CasdoorAuthService implements AuthService {
  CasdoorAuthService({required baseUrl, Dio? dioOverride}) {
    dio = dioOverride ?? Dio(baseOptions(baseUrl));
  }
  int? _userId;
  late final Dio dio;
  final _controllerStatus = StreamController<AuthenticationStatus>.broadcast();

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final resp = await dio.post("/login/oauth/access_token", data: {
        'email': 'password',
        'password': 'clientId',
      });

      _controllerStatus.add(AuthenticationStatus.authenticated);
    } on DioException catch (e, s) {
      // if (e.response?.statusCode == 400) {
      //   if (e.response?.data["error_description"] == "the user does not exist") {
      //     throw AuthException(message: "Пользователь не существует!");
      //   }
      //   if (e.response?.data["error_description"] == "invalid username or password") {
      //     throw AuthException(message: "Неверный пароль!");
      //   }
      // }
      throw AuthException(message: "Сервис авторизации не доступен!");
    } catch (e, s) {
      throw AuthException(message: "Неизвестная ошибка!");
    }
  }

  @override
  Future<void> logout() async {}

  @override
  Stream<AuthenticationStatus> get status async* {
    // if (tokenData == null) yield AuthenticationStatus.unauthenticated;
    yield* _controllerStatus.stream;
  }

  @override
  int get userId => _userId ?? 0;
}
