// next_page.dart
import 'package:flutter/material.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Halaman Berikutnya'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman berikutnya',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
