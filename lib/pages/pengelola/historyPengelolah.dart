import 'package:flutter/material.dart';

class HistoryPengelola extends StatefulWidget {
  const HistoryPengelola({super.key});

  @override
  _HistoryPengelolaState createState() => _HistoryPengelolaState();
}

class _HistoryPengelolaState extends State<HistoryPengelola> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? expandedIndex;

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

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah anda yakin ingin menghapus kampanye ini?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batalkan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'HAPUS',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                // Implement delete functionality here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF0EBE7F),
          unselectedLabelColor: const Color(0xFF677294),
          indicatorColor: const Color(0xFF0EBE7F),
          tabs: const [
            Tab(text: 'Kampanye Anda'),
            Tab(text: 'Tayangan Terakhir'),
          ],
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0), // Padding untuk memindahkan teks sedikit ke bawah
          child: Center(
            child: const Text(
              'History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCampaignHistory(),
          _buildViewHistory(),
        ],
      ),
    );
  }

  Widget _buildCampaignHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
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
                          image: const DecorationImage(
                            image: AssetImage('assets/homepage/banjirbandang.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Donasi Korban Banjir Bandang',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF404345),
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (isExpanded) ...[
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      margin: const EdgeInsets.only(right: 8),
                                      child: MaterialButton(
                                        onPressed: () {
                                          // Implementasi edit
                                        },
                                        color: const Color(0xFF0EBE7F),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'EDIT',
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
                                      margin: const EdgeInsets.only(left: 8),
                                      child: MaterialButton(
                                        onPressed: () {
                                          _showDeleteConfirmation(context);
                                        },
                                        color: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'HAPUS',
                                          style: TextStyle(
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
                      const Text(
                        '12 Jan 2024',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF677294),
                        ),
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