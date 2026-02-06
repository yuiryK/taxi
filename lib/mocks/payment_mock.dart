import 'package:logger/logger.dart';

final _logger = Logger();

class PaymentServiceMock {
  Future<bool> payRide(String rideId, double amount) async {
    await Future.delayed(const Duration(milliseconds: 400));

    _logger.i('💳 Payment processed: ride=$rideId amount=$amount');
    return true;
  }
}
