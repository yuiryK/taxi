import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentRidesScreen extends ConsumerWidget {
  const CurrentRidesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        "Current Rides Screen",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}