import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateRideScreen extends ConsumerWidget {
  const CreateRideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        "Create Ride Screen",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}