import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 1,
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF0EBE7F).withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color(0xFF0EBE7F),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Single Background Image with Pattern
          Image.asset(
            'assets/vector 5.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            color: const Color(0xFF0EBE7F).withOpacity(0.1),
            colorBlendMode: BlendMode.srcOver,
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Kebijakan Privasi Domal',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0EBE7F),
                        ),
                      ),
                    ),
                    _buildSection(
                      'Pendahuluan',
                      'Selamat datang di Domal, platform donasi yang menghubungkan para donatur dengan mereka yang membutuhkan. Kami menghargai kepercayaan yang Anda berikan kepada kami dan berkomitmen untuk melindungi privasi Anda.',
                    ),
                    _buildSection(
                      'Informasi yang Kami Kumpulkan',
                      'Kami mengumpulkan informasi berikut:',
                      bulletPoints: [
                        'Informasi pribadi (nama, alamat email, nomor telepon)',
                        'Informasi pembayaran (detail rekening bank, e-wallet)',
                        'Riwayat donasi',
                        'Data penggunaan aplikasi',
                      ],
                    ),
                    _buildSection(
                      'Penggunaan Informasi',
                      'Informasi yang kami kumpulkan digunakan untuk:',
                      bulletPoints: [
                        'Memproses donasi Anda',
                        'Mengirimkan bukti dan laporan donasi',
                        'Memberikan informasi tentang kampanye donasi',
                        'Meningkatkan layanan kami',
                      ],
                    ),
                    _buildSection(
                      'Keamanan Data',
                      'Kami mengimplementasikan langkah-langkah keamanan yang ketat untuk melindungi data Anda, termasuk enkripsi data, autentikasi dua faktor, dan pemantauan keamanan berkelanjutan.',
                    ),
                    _buildSection(
                      'Berbagi Informasi',
                      'Kami tidak akan menjual, menyewakan, atau menukar informasi pribadi Anda dengan pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum.',
                    ),
                    _buildSection(
                      'Hak Pengguna',
                      'Anda memiliki hak untuk:',
                      bulletPoints: [
                        'Mengakses data pribadi Anda',
                        'Memperbarui atau mengoreksi data Anda',
                        'Meminta penghapusan data',
                        'Menarik persetujuan penggunaan data',
                      ],
                    ),
                    _buildSection(
                      'Perubahan Kebijakan',
                      'Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Perubahan signifikan akan diberitahukan melalui aplikasi atau email.',
                    ),
                    _buildSection(
                      'Kontak',
                      'Jika Anda memiliki pertanyaan tentang kebijakan privasi kami, silakan hubungi kami di:\n\nEmail: support@domal.id\nTelepon: +62 812-3456-7890',
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Terakhir diperbarui: 8 Februari 2025',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content, {List<String>? bulletPoints}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0EBE7F),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        if (bulletPoints != null) ...[
          const SizedBox(height: 8),
          ...bulletPoints.map((point) => Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', 
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0EBE7F),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ],
    );
  }
}