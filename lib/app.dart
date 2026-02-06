// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Mock App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final ridesAsync = ref.watch(availableRidesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Taxi Mock App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Пользователь
            userAsync.when(
              data: (user) => Text("👤 User: ${user['name']}"),
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text("Error loading user: $err"),
            ),

            const SizedBox(height: 20),

            // Кнопка загрузки пользователя (для обновления)
            ElevatedButton(
              onPressed: () {ref.refresh(currentUserProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Кнопка сработала!"),
                  ),
                              );
              },
              
              child: const Text("Load User"),
            ),

            const SizedBox(height: 40),

            // Список поездок
            ridesAsync.when(
              data: (rides) => Expanded(
                child: ListView.builder(
                  itemCount: rides.length,
                  itemBuilder: (context, index) {
                    final ride = rides[index];
                    return ListTile(
                      leading: const Icon(Icons.local_taxi),
                      title: Text("${ride['from']!} → ${ride['to']!}"),
                      subtitle: Text("Driver: ${ride['driver']}"),
                    );
                  },
                ),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text("Error loading rides: $err"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => ref.refresh(availableRidesProvider),
              child: const Text("Load Rides"),
            ),
          ],
        ),
      ),
    );
  }
}
