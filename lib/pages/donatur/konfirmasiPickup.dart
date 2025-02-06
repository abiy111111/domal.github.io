import 'package:flutter/material.dart';
import 'tambahAlamat.dart';
import '../HalamanChat.dart';
import 'selesaiDonasi.dart';

class PickupConfirmationScreen extends StatefulWidget {
  const PickupConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<PickupConfirmationScreen> createState() => _PickupConfirmationScreenState();
}

class _PickupConfirmationScreenState extends State<PickupConfirmationScreen> {
  Map<String, String>? selectedAddress;
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _managerNameController = TextEditingController();
  final TextEditingController _managerContactController = TextEditingController();
  final TextEditingController _paymentMethodController = TextEditingController();
  
  final Color themeColor = const Color(0xFF0BA56E);

  // Add dummy data for manager
  final String dummyManagerName = "Budi Santoso";
  final String dummyManagerContact = "+62812345678";

  // Payment method options
  final List<String> paymentMethods = [
    'Transfer Bank',
    'E-Wallet',
    'Tunai',
    'QRIS'
  ];

  @override
  void initState() {
    super.initState();
    _managerNameController.text = dummyManagerName;
    _managerContactController.text = dummyManagerContact;
    _paymentMethodController.text = paymentMethods[0];
  }

  @override
  void dispose() {
    _messageController.dispose();
    _managerNameController.dispose();
    _managerContactController.dispose();
    _paymentMethodController.dispose();
    super.dispose();
  }

  void _navigateToChat() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          managerName: dummyManagerName,
          managerContact: dummyManagerContact,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Konfirmasi Penjemputan',
          style: TextStyle( color: const Color.fromARGB(255, 0, 0, 0),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemDetails(),
            const SizedBox(height: 16),
            _buildAddressSection(),
            const SizedBox(height: 16),
            _buildForm(),
            const SizedBox(height: 16),
            _buildShippingCost(),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: themeColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Handuk Anak',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: themeColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Jumlah = 12', style: TextStyle(color: themeColor)),
                Text('Kondisi = Baru', style: TextStyle(color: themeColor)),
                Text('Berat = 1,5kg', style: TextStyle(color: themeColor)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/handuk.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Alamat Pengambilan',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push<Map<String, String>>(
                    context,
                    MaterialPageRoute(builder: (context) => const TambahAlamat()),
                  );
                  if (result != null) {
                    setState(() {
                      selectedAddress = result;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: const Text(
                  'Tentukan Alamat',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (selectedAddress != null) ...[
            Text(
              selectedAddress!['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(selectedAddress!['phone']!),
            const SizedBox(height: 4),
            Text(selectedAddress!['address']!),
            Text(selectedAddress!['location']!),
            if (selectedAddress!['type']!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  selectedAddress!['type']!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ] else
            const Text(
              'Saat ini belum ada alamat, tolong masukkan alamat nya!',
              style: TextStyle(color: Colors.grey),
            ),
        ],
      ),
    );
  }


  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pesan untuk pengelola :', style: TextStyle(color: themeColor)),
        const SizedBox(height: 4),
        TextField(
          controller: _messageController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Tulis pesan anda disini...',
            hintStyle: TextStyle(color: themeColor.withOpacity(0.5)),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: themeColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: themeColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: themeColor),
            ),
          ),
        ),
        const SizedBox(height: 16),

        Text('Nama Pengelola :', style: TextStyle(color: themeColor)),
        const SizedBox(height: 4),
        TextField(
          controller: _managerNameController,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: themeColor),
            ),
            filled: true,
            fillColor: themeColor.withOpacity(0.1),
          ),
        ),
        const SizedBox(height: 16),

        Text('Contact Pengelola :', style: TextStyle(color: themeColor)),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _managerContactController,
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: themeColor),
                  ),
                  filled: true,
                  fillColor: themeColor.withOpacity(0.1),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: _navigateToChat,
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.message, color: Colors.white),
              label: const Text(
                'Hubungi',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Text('Metode Pembayaran :', style: TextStyle(color: themeColor)),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: _paymentMethodController.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: themeColor),
            ),
          ),
          items: paymentMethods.map((String method) {
            return DropdownMenuItem<String>(
              value: method,
              child: Text(method, style: TextStyle(color: themeColor)),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _paymentMethodController.text = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildShippingCost() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Ongkos Kirim : Rp 30.000',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
 Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: themeColor,
              side: BorderSide(color: themeColor),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Batal'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelesaiDonasi()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Konfirmasi'),
          ),
        ),
      ],
    );
  }
}