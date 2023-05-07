import 'package:flutter/material.dart';
import 'package:video_sharing/mobile.dart' as first;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Started Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => first.MobileNumberInputPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
