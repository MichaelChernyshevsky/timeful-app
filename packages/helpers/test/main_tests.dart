// @TestOn('vm')
// library;

// import 'package:flutter_test/flutter_test.dart';

// import 'dart:developer' as dev;

// import 'package:helpers/auth/auth_service.dart';
// import 'package:helpers/auth/service.dart';


// void main() {
//   late AuthService authService;
//   // late HttpService httpService;

//   setUpAll(() async {
//     authService = CasdoorAuthService();
//     await authService.login(username: username, password: password);
//     // httpService = DioHttpService(baseUrl: baseUri, authService: authService,userId: );
//     // userRepo = UserRepository(httpService: httpService);
//   });

//   tearDownAll(() {
//     authService.logout();
//   });

//   test("Получение информации о текущем пользователе", () async {
//     final user = await userRepo.getUserInfo();
//     dev.log("message");
//   });
// }
