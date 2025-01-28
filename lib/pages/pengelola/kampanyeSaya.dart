import 'package:flutter/material.dart';
import 'detailKampanyePengelola.dart';

class KampanyeSaya extends StatefulWidget {
  const KampanyeSaya({super.key});

  @override
  _KampanyeSayaState createState() => _KampanyeSayaState();
}

class _KampanyeSayaState extends State<KampanyeSaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Kampanye Anda',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          bool isApproved = index % 2 == 0;

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar di sebelah kiri
                      Container(
                        width: 100, // Lebih besar dari sebelumnya
                        height: 100, // Lebih besar dari sebelumnya
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage('assets/homepage/banjirbandang.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Tulisan di sebelah kanan gambar
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Donasi Korban Banjir Bandang',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF404345),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Image.asset(
                                  isApproved
                                      ? 'assets/centang.png'
                                      : 'assets/jam.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  isApproved
                                      ? 'Telah Disetujui Admin'
                                      : 'Belum Disetujui Admin',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isApproved
                                        ? Color(0xFF0EBE7F)
                                        : Color(0xFFF56D42),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5), 

                  // Baris untuk tanggal dan tombol
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Tanggal di bawah gambar
                      Text(
                        '12 Jan 2024',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF677294),
                        ),
                      ),

                      // Tombol di bawah kanan
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailKampanyePengelola(
                                title: 'Donasi Korban Banjir Bandang di Manado',
                                image: 'assets/homepage/banjirbandang.jpg',
                                collected: 8510000,
                                target: 11000000,
                                donators: 67,
                                percentage: 75.0,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0EBE7F),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'See Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
