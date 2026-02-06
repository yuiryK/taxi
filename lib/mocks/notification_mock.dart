import 'package:logger/logger.dart';

final _logger = Logger();

class NotificationServiceMock {
  Future<void> sendNotification(String message) async {
    await Future.delayed(const Duration(milliseconds: 200));

    _logger.i('🔔 Notification: $message');
  }
}
