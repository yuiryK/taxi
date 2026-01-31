// lib/providers/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../mocks/user_mock.dart';
import '../mocks/ride_mock.dart';
import '../mocks/location_mock.dart';
import '../mocks/auth_mock.dart';
import '../mocks/payment_mock.dart';
import '../mocks/notification_mock.dart';

/// ---------------------------
/// Репозитории / Сервисы (моки)
/// ---------------------------

final userRepositoryProvider =
    Provider<UserRepositoryMock>((ref) => UserRepositoryMock());

final rideRepositoryProvider =
    Provider<RideRepositoryMock>((ref) => RideRepositoryMock());

final locationServiceProvider =
    Provider<LocationServiceMock>((ref) => LocationServiceMock());

final authServiceProvider =
    Provider<AuthServiceMock>((ref) => AuthServiceMock());

final paymentServiceProvider =
    Provider<PaymentServiceMock>((ref) => PaymentServiceMock());

final notificationServiceProvider =
    Provider<NotificationServiceMock>((ref) => NotificationServiceMock());

/// ---------------------------
/// FutureProviders для UI
/// ---------------------------

final currentUserProvider =
    FutureProvider<Map<String, String>>((ref) async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.getCurrentUser();
});

final availableRidesProvider =
    FutureProvider<List<Map<String, String>>>((ref) async {
  final repo = ref.watch(rideRepositoryProvider);
  return repo.getAvailableRides();
});
