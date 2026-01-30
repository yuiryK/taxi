import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mocks/ride_mock.dart';
import 'domain/entities/ride.dart';

final rideRepositoryProvider = Provider((ref) => RideRepositoryMock());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(   // Riverpod Scope
      child: MaterialApp(
        title: 'Taxi App',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rideRepo = ref.watch(rideRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hello World')),
      body: FutureBuilder<List<Ride>>(
        future: rideRepo.getAvailableRides(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final rides = snapshot.data!;
          return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (context, index) {
              final ride = rides[index];
              return ListTile(
                title: Text('${ride.start} → ${ride.end}'),
                subtitle: Text('Водитель: ${ride.driverName}'),
              );
            },
          );
        },
      ),
    );
  }
}
