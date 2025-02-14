import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0EBE7F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('Semua', 0),
                _buildTabButton('Belum Dibaca', 1),
                _buildTabButton('Sudah Dibaca', 2),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: _getNotificationsForTab(selectedTabIndex)
                  .map((notification) => NotificationCard(
                        title: notification['title'] ?? '',
                        subtitle: notification['subtitle'] ?? '',
                        timestamp: notification['timestamp'] ?? '',
                        status: notification['status'] ?? '',
                        showReport: notification['showReport'] ?? false,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selectedTabIndex == index ? const Color(0xFF0EBE7F) : const Color(0xFF677294),
            ),
          ),
          if (selectedTabIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 60,
              color: const Color(0xFF0EBE7F),
            ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getNotificationsForTab(int tabIndex) {
    if (tabIndex == 0) {
      return [
        {
          'title': 'Kampanye Telah Tersalurkan!',
          'subtitle': 'Donasi anda untuk kampanye "DONASI KUCING TERLANTAR" telah berhasil disalurkan kepada penerima',
          'timestamp': 'Baru saja',
          'status': 'completed',
          'showReport': true,
        },
        {
          'title': 'Terima Kasih Atas Donasi Anda!',
          'subtitle': 'Donasi sebesar Rp 100.000 untuk kampanye "BANTU OPERASI KUCING" telah kami terima',
          'timestamp': '2 jam yang lalu',
          'status': 'processing',
          'showReport': false,
        },
        {
          'title': 'Kampanye Sedang Disalurkan',
          'subtitle': 'Donasi anda untuk "STERILISASI KUCING JALANAN" sedang dalam proses penyaluran',
          'timestamp': '1 hari yang lalu',
          'status': 'ongoing',
          'showReport': false,
        },
      ];
    } else if (tabIndex == 1) {
      return [
        {
          'title': 'Kampanye Telah Tersalurkan!',
          'subtitle': 'Donasi anda untuk kampanye "DONASI KUCING TERLANTAR" telah berhasil disalurkan kepada penerima',
          'timestamp': 'Baru saja',
          'status': 'completed',
          'showReport': true,
        },
      ];
    } else {
      return [
        {
          'title': 'Terima Kasih Atas Donasi Anda!',
          'subtitle': 'Donasi sebesar Rp 100.000 untuk kampanye "BANTU OPERASI KUCING" telah kami terima',
          'timestamp': '2 jam yang lalu',
          'status': 'processing',
          'showReport': false,
        },
        {
          'title': 'Kampanye Sedang Disalurkan',
          'subtitle': 'Donasi anda untuk "STERILISASI KUCING JALANAN" sedang dalam proses penyaluran',
          'timestamp': '1 hari yang lalu',
          'status': 'ongoing',
          'showReport': false,
        },
      ];
    }
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timestamp;
  final String status;
  final bool showReport;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.status,
    required this.showReport,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF404345),
                    ),
                  ),
                ),
                Image.asset(
                  status == 'completed' ? 'assets/centang.png' : 'assets/jam.png',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF677294),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              timestamp,
              style: const TextStyle(
                color: Color(0xFF677294),
                fontSize: 10,
              ),
            ),
            if (showReport) ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0EBE7F),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('Lihat Laporan', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}