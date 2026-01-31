class NotificationServiceMock {
  Future<void> sendNotification(String message) async {
    await Future.delayed(const Duration(milliseconds: 200));

    print("🔔 Notification: $message");
  }
}
