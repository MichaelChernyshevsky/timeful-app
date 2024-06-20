enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

abstract class AuthService {
  Stream<AuthenticationStatus> get status;

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  int get userId;
}
