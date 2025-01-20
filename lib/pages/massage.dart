import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String selectedFilter = 'Semua';
  bool isDropdownOpen = false;

  // Extended sample message data
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'IkhlasLahirBatin',
      'message': 'Terima kasih atas donasinya kak...',
      'date': '26/8',
      'isRead': false,
    },
    {
      'sender': 'PeduliSesama',
      'message': 'Mohon konfirmasi penerimaan bantuan...',
      'date': '26/8',
      'isRead': true,
    },
    {
      'sender': 'BerbagiRezeki',
      'message': 'Sudah kami transfer ke rekening yang dituju',
      'date': '25/8',
      'isRead': false,
    },
    {
      'sender': 'AmalShaleh',
      'message': 'Bagaimana kabar anak-anak di panti?',
      'date': '25/8',
      'isRead': true,
    },
    {
      'sender': 'KasihSayang',
      'message': 'Untuk program beasiswa periode depan...',
      'date': '24/8',
      'isRead': true,
    },
    {
      'sender': 'BantuanCepat',
      'message': 'Pengiriman bantuan sudah dalam perjalanan',
      'date': '24/8',
      'isRead': false,
    },
    {
      'sender': 'PeduliPendidikan',
      'message': 'Laporan penggunaan dana bulan ini...',
      'date': '23/8',
      'isRead': true,
    },
    {
      'sender': 'AmalJariyah',
      'message': 'Konfirmasi jadwal kunjungan besok',
      'date': '23/8',
      'isRead': false,
    },
  ];

  List<Map<String, dynamic>> getFilteredMessages() {
    switch (selectedFilter) {
      case 'Sudah Dibaca':
        return messages.where((msg) => msg['isRead']).toList();
      case 'Belum Dibaca':
        return messages.where((msg) => !msg['isRead']).toList();
      default:
        return messages;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Search bar
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Kontak, Pengelola, & lain-lain',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),

              // Filter dropdown trigger
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isDropdownOpen = !isDropdownOpen;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedFilter,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              // Messages list
              Expanded(
                child: ListView.builder(
                  itemCount: getFilteredMessages().length,
                  itemBuilder: (context, index) {
                    final message = getFilteredMessages()[index];
                    return _buildMessageTile(message);
                  },
                ),
              ),
            ],
          ),

          // Blur overlay and dropdown when open
          if (isDropdownOpen)
            Column(
              children: [
                const SizedBox(height: 130), // Height of search + filter trigger
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFilterOption('Semua'),
                      _buildFilterOption('Belum Dibaca'),
                      _buildFilterOption('Sudah Dibaca'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = title;
          isDropdownOpen = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: selectedFilter == title ? FontWeight.bold : FontWeight.normal,
            color: selectedFilter == title ? Colors.black : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageTile(Map<String, dynamic> message) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 0.5),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 25,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        title: Row(
          children: [
            Text(
              message['sender'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              message['date'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                message['message'],
                 style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!message['isRead'])
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
        onTap: () {
          // Handle message tap
        },
      ),
    );
  }
}