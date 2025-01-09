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
      body: Stack(
        fit: StackFit.expand, // Membuat gambar mengisi seluruh layar
        children: [
          // Menampilkan gambar dengan ukuran penuh (full-screen)
          Image.asset(
            'assets/openingimage.jpg', // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Gambar akan menutupi layar
          ),
          // Layer di atas gambar untuk menambahkan teks atau widget lainnya
          Center(
            child: Text(
              'halo domal',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks agar terlihat di atas gambar
              ),
            ),
          ),
        ],
      ),
    );
  }
}
