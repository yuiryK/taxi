import 'package:flutter/material.dart';
import 'package:taxi/presentation/shell/main_shell.dart';
import 'presentation/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Mock App',
      debugShowCheckedModeBanner: false,
      home: MainShell(),
    );
  }
}