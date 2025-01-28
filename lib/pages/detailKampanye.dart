import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../pages/donatur/opsi_donasi_donatur.dart';

class DetailKampanye extends StatelessWidget {
  final String title;
  final String image;
  final int collected;
  final int target;
  final int donators;
  final double percentage;

  const DetailKampanye({
    super.key,
    required this.title,
    required this.image,
    required this.collected,
    required this.target,
    required this.donators,
    required this.percentage,
  });

  String formatToRupiah(int number) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatCurrency.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with back button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Detail Kampanye',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Campaign Image and Title
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Campaign Description
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Text(
                              'Pelosok membutuhkan perhatian kita, terutama anak-anak yang menghadapi tantangan besar dalam pendidikan dan kebutuhan dasar. Dengan menyumbang, kita dapat membantu menyediakan makanan, obat-obatan, dan akses pendidikan. Setiap donasi, sekecil apapun, bisa membuat perbedaan besar. Mari tunjukkan kepedulian kita dan bantu mereka yang berharap.',
                               style: TextStyle(
                                fontSize: 14,
                                color: Colors.black, 
                                fontWeight: FontWeight.bold, 
                                height: 1.5,
                             ),
                           ),
                          ),

                          // Target and Progress
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Target',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7F),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    formatToRupiah(target),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Donatur yang telah berdonasi',
                                    style: TextStyle(
                                      color: Color(0xFF0EBE7F),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '$donators donatur',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Collected Amount
                          const Text(
                            'Sudah Terkumpul',
                            style: TextStyle(
                              color: Color(0xFF0EBE7F),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            formatToRupiah(collected),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Progress Bar
                          Row(
                            children: [
                              const Text(
                                'Progress donasi',
                                style: TextStyle(
                                  color: Color(0xFF0EBE7F),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${percentage.toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: percentage / 100,
                              backgroundColor: Colors.black12,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF10B981),
                              ),
                              minHeight: 8,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

           // Donation Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PilihDonasi()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Mulai Berdonasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}