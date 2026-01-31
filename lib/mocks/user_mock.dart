import "mock_data.dart";

class UserRepositoryMock {
  Future<Map<String, String>> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return MockData.users.first
        .map((k, v) => MapEntry(k, v.toString()));
  }
}
