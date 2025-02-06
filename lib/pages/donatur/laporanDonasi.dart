import 'package:flutter/material.dart';

class LaporanDonasi extends StatefulWidget {
  const LaporanDonasi({Key? key}) : super(key: key);

  @override
  State<LaporanDonasi> createState() => _LaporanDonasiState();
}

class _LaporanDonasiState extends State<LaporanDonasi> {
  bool _showAllItems = false;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text('Donasi Korban Banjir Bandang\ndi Manado 15 Januari 2014',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0, -12), // Adjust this value to move text up/down
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '@TelkomPeduli',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildInfoCard(),
            SizedBox(height: 24),
            _buildDonationProgress(),
            SizedBox(height: 24),
            _buildDonationItems(),
            SizedBox(height: 24),
            Text('Dokumentasi Dan penyerahan bantuan',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )),
            SizedBox(height: 16),
            _buildImageGallery(),
            SizedBox(height: 24),
            _buildDistributionDetails(),
            SizedBox(height: 24),
            _buildThankYouMessage(),
          ],
        ),
      ),
    ),
  );
}

Widget _buildInfoCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Image section
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/korbanbanjir.jpg',
          width: double.infinity,
          height: 240,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 16),
      // Text sections
      Text(
        'Pada tanggal 15 Januari 2014, Kota Manado dilanda banjir bandang setinggi 4 meter akibat hujan deras berkelanjutan.',
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(height: 16),
      Text(
        'Banjir ini menghancurkan infrastruktur, merusak lebih dari 1.000 rumah, dan merenggut nyawa 18 warga. Saat ini, banyak keluarga yang membutuhkan bantuan.',
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(height: 16),
      Text(
        'Mari berkontribusi untuk meringankan beban mereka. Setiap donasi Anda sangat berarti untuk menyediakan kebutuhan dasar dan dukungan pemulihan.',
        style: TextStyle(fontSize: 14),
      ),
    ],
  );
}
  Widget _buildDonationProgress() {
    return Container(
      padding: EdgeInsets.all(12), // Reduced padding from 16 to 12
      decoration: BoxDecoration(
        color: Color(0xFF0EBE7F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Berhasil Terkumpul',
              style: TextStyle(color: Colors.white, fontSize: 14)), // Reduced from 16
          SizedBox(height: 4), // Reduced spacing from 8 to 4
          Text('11.000.000 Rupiah Terkumpul',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16, // Reduced from 18
                  fontWeight: FontWeight.bold)),
          Text('Dari Target 11.000.000 Rupiah',
              style: TextStyle(color: Colors.white, fontSize: 12)), // Reduced from 14
        ],
      ),
    );
  }

  Widget _buildDonationItems() {
    final initialItems = ['Obat-obatan', 'Pakaian', 'Peralatan Dapur'];
    final allItems = [...initialItems, 'Makanan'];
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Donasi berupa barang:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...((_showAllItems ? allItems : initialItems).map((item) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, size: 16, color: Colors.green),
                    SizedBox(width: 8),
                    Text(item),
                  ],
                ),
              ))),
          TextButton(
            onPressed: () {
              setState(() {
                _showAllItems = !_showAllItems;
              });
            },
            child: Text('Lihat selengkapnya...'),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGallery() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/korban.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/banjir.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/kebanjiran.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDistributionDetails() {
  final distributions = [
    {
      'amount': '4.000.000',
      'purpose': 'Makanan dan air bersih',
      'notes': 'Pembelian untuk 400 orang'
    },
    {
      'amount': '2.500.000',
      'purpose': 'Obat-obatan dan perlengkapan dasar',
      'notes': 'Untuk posko kesehatan'
    },
    {
      'amount': '4.500.000',
      'purpose': 'Perbaikan rumah sementara',
      'notes': 'Material dan tenaga kerja'
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Detail Distribusi Dana',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 16),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Jumlah\nDidistribusikan')),
            DataColumn(label: Text('Tujuan\nPenggunaan')),
            DataColumn(label: Text('Keterangan')),
          ],
          rows: distributions
              .map((item) => DataRow(cells: [
                    DataCell(Text(item['amount']!)),
                    DataCell(Text(item['purpose']!)),
                    DataCell(Text(item['notes']!)),
                  ]))
              .toList(),
        ),
      ),
    ],
  );
}

  Widget _buildThankYouMessage() {
  return Align(
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Kami ingin mengucapkan terima kasih yang sebesar-besarnya atas dukungan dan sumbangan yang telah Anda berikan.',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Kontribusi Anda sangat berarti bagi kami dan Teman-teman. 😊',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
}