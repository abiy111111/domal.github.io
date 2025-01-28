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
        backgroundColor: const Color(0xFF0EBE7F), // Match your app's theme
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

  List<Map<String, String>> _getNotificationsForTab(int tabIndex) {
    if (tabIndex == 0) {
      return [
        {
          'title': 'Dennis Nedry requested access',
          'subtitle': 'to Isla Nublar SOC2 compliance report',
          'timestamp': 'Last Wednesday at 9:42 AM',
        },
        {
          'title': 'Najmah baru saja memposting kampanye:',
          'subtitle': 'DONASI KUCING TERLANTAR',
          'timestamp': 'Baru saja',
        },
        {
          'title': 'Adli menyukai komentar anda:',
          'subtitle': 'semoga adik lekas sembuh',
          'timestamp': '2 menit yang lalu',
        },
      ];
    } else if (tabIndex == 1) {
      return [
        {
          'title': 'Najmah baru saja memposting kampanye:',
          'subtitle': 'DONASI KUCING TERLANTAR',
          'timestamp': 'Baru saja',
        },
      ];
    } else {
      return [
        {
          'title': 'Adli menyukai komentar anda:',
          'subtitle': 'semoga adik lekas sembuh',
          'timestamp': '2 menit yang lalu',
        },
      ];
    }
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timestamp;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timestamp,
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
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF404345),
              ),
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
                  child: const Text('Setuju', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: const Color(0xFF677294),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('Abaikan', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}