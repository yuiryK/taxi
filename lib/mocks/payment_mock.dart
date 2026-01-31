class PaymentServiceMock {
  Future<bool> payRide(String rideId, double amount) async {
    await Future.delayed(const Duration(milliseconds: 400));

    print("💳 Payment processed: ride=$rideId amount=$amount");
    return true;
  }
}
