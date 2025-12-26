import 'package:flutter/material.dart';

class KelasSayaScreen extends StatelessWidget {
  const KelasSayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2E7D32),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Kelas Saya Content Placeholder'),
      ),
    );
  }
}
