import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransaksiBarang extends StatelessWidget {
  final Color themeColor = const Color(0xFF0EBE7F);
  final String title;
  final String donation;
  final String date;
  final String image;
  final int shippingCost;
  final String transactionId;
  final String address;
  final DateTime transactionDateTime;

  const TransaksiBarang({
    super.key,
    required this.title,
    required this.donation,
    required this.date,
    required this.image,
    required this.shippingCost,
    required this.transactionId,
    required this.address,
    required this.transactionDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: themeColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: themeColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: themeColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: themeColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.card_giftcard,
                      color: themeColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Donasi barang berhasil',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Rincian donasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                      ),
                    ),
                  ),
                  _buildTransactionDetail(
                    'Status',
                    'Selesai',
                    valueColor: themeColor,
                    showIcon: true,
                  ),
                  _buildTransactionDetail(
                    'Barang',
                    donation,
                  ),
                  _buildTransactionDetail(
                    'Waktu',
                    DateFormat('HH:mm').format(transactionDateTime),
                  ),
                  _buildTransactionDetail(
                    'Tanggal',
                    DateFormat('dd MMMM yyyy').format(transactionDateTime),
                  ),
                  _buildTransactionDetail(
                    'ID transaksi',
                    transactionId,
                    showCopy: true,
                  ),
                  const Divider(height: 1),
                  _buildTransactionDetail(
                    'Alamat Pengiriman',
                    address,
                    isMultiLine: true,
                  ),
                  _buildTransactionDetail(
                    'Biaya Pengiriman',
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(shippingCost),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.keyboard_arrow_up),
                            Text('Tutup'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDetail(
    String label,
    String value, {
    bool isBold = false,
    bool showIcon = false,
    bool showCopy = false,
    Color? valueColor,
    bool isMultiLine = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: isMultiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: isMultiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                      color: valueColor,
                    ),
                    textAlign: TextAlign.right,
                    softWrap: isMultiLine,
                  ),
                ),
                if (showIcon)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(Icons.check_circle, color: themeColor, size: 20),
                  ),
                if (showCopy)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(Icons.copy, color: Colors.grey[400], size: 20),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}