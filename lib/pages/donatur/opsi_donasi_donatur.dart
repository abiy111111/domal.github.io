import 'package:flutter/material.dart';
import 'pasca_bayar.dart';

class PilihDonasi extends StatefulWidget {
  const PilihDonasi({super.key});

  @override
  _PilihDonasiState createState() => _PilihDonasiState();
}

class _PilihDonasiState extends State<PilihDonasi> {
  String? selectedDonationType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFE0F2EA)],
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar
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
                    'Opsi Donasi',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

                  // Campaign Info Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/homepage/banjirbandang.jpg',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'DONASI KORBAN BANJIR DI MANADO',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'terkumpul',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Text(
                                    '8.510.000',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0EBE7F),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF0EBE7F),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        '75.0%',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        '76 donatur Stories',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Target amount
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Target',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '11.000.000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Anda ingin donasi berupa?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),

                  // Donation type selection
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: 350, // Adjust width as per requirement
                      height: 200, // Adjust height as per requirement
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildRadioOption('Uang', 'uang'),
                          const SizedBox(height: 12),
                          _buildRadioOption('Barang', 'barang'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Submit button (outside of the donation selection container)
                Padding(
  padding: const EdgeInsets.all(16.0),
  child: SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: selectedDonationType != null
          ? () {
              // Jika "Uang" dipilih, arahkan ke halaman pasca_bayar.dart
              if (selectedDonationType == 'uang') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DonationPaymentScreen()),
                );
              }
              // Jika ada kebutuhan lain (misalnya, opsi "Barang"), bisa ditangani di sini.
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0EBE7F),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Submit',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  ),
),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedDonationType == value
              ? const Color(0xFF0EBE7F)
              : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<String>(
        title: Text(
          label,
          style: TextStyle(
            color: selectedDonationType == value
                ? const Color(0xFF0EBE7F)
                : Colors.black,
          ),
        ),
        value: value,
        groupValue: selectedDonationType,
        onChanged: (String? value) {
          setState(() {
            selectedDonationType = value;
          });
        },
        activeColor: const Color(0xFF0EBE7F),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
