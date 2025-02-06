import 'package:flutter/material.dart';
import 'homepageDonatur.dart';
import 'historyDonatur.dart';

class SelesaiDonasi extends StatelessWidget {
  const SelesaiDonasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Jadwal Penjemputan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Delivery truck image
            Center(
              child: Image.asset(
                'assets/truk.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 16),

            // Confirmation message with check image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/centangbiru.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Penjemputan berhasil di jadwalkan',
                  style: TextStyle(
                    color: Color(0xFF4DC6FD),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Terima kasih telah berdonasi!',
                style: TextStyle(
                  color: Color(0xFF4DC6FD),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Container for details with mint background
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5F3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Item details
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Barang : ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Handuk Anak',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Address
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Alamat : ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Jln.Bunga Melati Kompleks Berlin No 8,Kel,Kec,Kota,Prov,ID 6666',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Contact button
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kontak Pengelola : ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/message.png',
                            width: 16,
                            height: 16,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Hubungi',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00A86B),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Waiting message with tap functionality
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/wait.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(height: 8),
                        const TappableWaitingMessage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomepageDonatur()),
              );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A86B),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPage()),
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A86B),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Lihat Donasi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TappableWaitingMessage extends StatefulWidget {
  const TappableWaitingMessage({Key? key}) : super(key: key);

  @override
  State<TappableWaitingMessage> createState() => _TappableWaitingMessageState();
}

class _TappableWaitingMessageState extends State<TappableWaitingMessage> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = true;
        });
      },
      child: Text(
        _isPressed
            ? 'Pengelola akan menjemput barang dalam 20 menit'
            : 'Menunggu pengelola menjemput barang mu',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}