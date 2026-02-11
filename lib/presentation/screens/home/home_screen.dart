import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../ui_kit/buttons/app_button.dart';

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

            // Load User Button
            AppButton(
              label: "Load User",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Кнопка сработала!"),
                  ),
                );
              },
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

            // Load Rides Button
            AppButton(
              label: "Load Rides",
              onPressed: () => ref.refresh(availableRidesProvider),
            ),
          ],
        ),
      ),
    );
  }
}