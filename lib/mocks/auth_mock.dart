class AuthServiceMock {
  bool _loggedIn = false;

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));

    _loggedIn = username.isNotEmpty && password.isNotEmpty;
    return _loggedIn;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _loggedIn = false;
  }

  bool get isLoggedIn => _loggedIn;
}
