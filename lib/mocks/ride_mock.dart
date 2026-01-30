import '../domain/entities/ride.dart';

class RideRepositoryMock {
  final List<Ride> _rides = [
    Ride(id: '1', start: 'Point A', end: 'Point B', driverName: 'Ivan'),
    Ride(id: '2', start: 'Point C', end: 'Point D', driverName: 'Olga'),
  ];

  Future<List<Ride>> getAvailableRides() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _rides;
  }
}
