import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: const Center(
        child: Text(
          'Selamat datang di aplikasi Gen!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
