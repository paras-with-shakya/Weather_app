import 'package:flutter/material.dart';
import 'package:sun_set/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// The app is weather app that fetches and displays weather information based on user input.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 124, 91)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
