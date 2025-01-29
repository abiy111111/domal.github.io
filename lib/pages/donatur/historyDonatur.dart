import 'package:flutter/material.dart';
import 'riwayatTransaksi.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? expandedIndex;

  final List<Map<String, dynamic>> donationData = [
    {
      'title': 'Donasi Korban Banjir Bandang',
      'donation': 100000,
      'date': '12 Jan 2024',
      'status': 'completed',
      'type': 'uang',
      'image': 'assets/homepage/banjirbandang.jpg',
      'paymentMethod': 'GOPAY',
      'transactionId': 'TRX202401120001',
      'transactionDateTime': DateTime(2024, 1, 12, 14, 30),
    },
    {
      'title': 'Bantuan Gempa Aceh',
      'donation': '5 Kardus Pakaian Layak Pakai',
      'date': '15 Jan 2024',
      'status': 'collecting',
      'type': 'barang',
      'image': 'assets/homepage/banjirbandang.jpg',
    },
    {
      'title': 'Donasi Panti Asuhan',
      'donation': '2 Kardus Buku & Alat Tulis',
      'date': '18 Jan 2024',
      'status': 'ongoing',
      'type': 'barang',
      'image': 'assets/homepage/banjirbandang.jpg',
    },
    {
      'title': 'Donasi Bencana Longsor',
      'donation': 250000,
      'date': '20 Jan 2024',
      'status': 'completed',
      'type': 'uang',
      'image': 'assets/homepage/banjirbandang.jpg',
      'paymentMethod': 'BCA',
      'transactionId': 'TRX202401200002',
      'transactionDateTime': DateTime(2024, 1, 20, 15, 45),
    },
    {
      'title': 'Bantuan Korban Kebakaran',
      'donation': '3 Kardus Sembako',
      'date': '22 Jan 2024',
      'status': 'collecting',
      'type': 'barang',
      'image': 'assets/homepage/banjirbandang.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleExpanded(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'completed':
        return 'Donasi Telah Disalurkan';
      case 'collecting':
        return 'Pengumpulan Dana';
      case 'ongoing':
        return 'Donasi Sedang Berlangsung';
      default:
        return '';
    }
  }

  Color _getStatusColor(String status) {
    return status == 'completed' ? const Color(0xFF0EBE7F) : Colors.orange;
  }

  void _navigateToTransactionHistory(Map<String, dynamic> donation) {
    if (donation['type'] == 'uang') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RiwayatTransaksi(
            amount: donation['donation'] as int,
            selectedPaymentMethod: donation['paymentMethod'],
            transactionId: donation['transactionId'],
            transactionDateTime: donation['transactionDateTime'],
          ),
        ),
      );
    }
  }

  String _formatDonation(dynamic donation) {
    if (donation is int) {
      return 'Rp ${donation.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
    }
    return donation.toString();
  }

  @override
  Widget build(BuildContext context) {
    // Rest of the build method remains the same
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF0EBE7F),
          unselectedLabelColor: const Color(0xFF677294),
          indicatorColor: const Color(0xFF0EBE7F),
          tabs: const [
            Tab(text: 'Aktivitas Donasi'),
            Tab(text: 'Tayangan Terakhir'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDonationHistory(),
          _buildViewHistory(),
        ],
      ),
    );
  }

  Widget _buildDonationHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: donationData.length,
      itemBuilder: (context, index) {
        final donation = donationData[index];
        bool isCompleted = donation['status'] == 'completed';
        bool isExpanded = expandedIndex == index;
        
        return GestureDetector(
          onTap: () => _toggleExpanded(index),
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(donation['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donation['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF404345),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatDonation(donation['donation']),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0EBE7F),
                              ),
                            ),
                            if (isExpanded) ...[
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  if (isCompleted)
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.only(right: 8),
                                        child: MaterialButton(
                                          onPressed: () {
                                            // Implementasi lihat laporan
                                          },
                                          color: const Color(0xFF0EBE7F),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Text(
                                            'Lihat Laporan',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      margin: EdgeInsets.only(left: isCompleted ? 8 : 0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (donation['type'] == 'uang') {
                                            _navigateToTransactionHistory(donation);
                                          }
                                        },
                                        color: const Color(0xFF0EBE7F),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          donation['type'] == 'barang' 
                                              ? 'Detail Barang'
                                              : 'Riwayat Transaksi',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        donation['date'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF677294),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            isCompleted ? 'assets/centang.png' : 'assets/jam.png',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getStatusText(donation['status']),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _getStatusColor(donation['status']),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildViewHistory() {
    // View history implementation remains the same
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/homepage/banjirbandang.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Donasi Korban Banjir Bandang',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF404345),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '12 Jan 2024 • 14:30',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF677294),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}