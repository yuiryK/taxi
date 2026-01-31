class LocationServiceMock {
  Future<Map<String, double>> getCurrentLocation() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return {
      "lat": 59.377,
      "lng": 28.190,
    };
  }
}
