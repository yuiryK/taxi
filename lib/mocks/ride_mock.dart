import "mock_data.dart";

class RideRepositoryMock {
  Future<List<Map<String, String>>> getAvailableRides() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return MockData.rides
        .map((ride) => ride.map((k, v) => MapEntry(k, v.toString())))
        .toList();
  }
}
