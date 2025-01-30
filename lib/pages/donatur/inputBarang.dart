import 'package:flutter/material.dart';
import 'konfirmasiPickup.dart';
class InputBarangPage extends StatefulWidget {
  const InputBarangPage({Key? key}) : super(key: key);

  @override
  State<InputBarangPage> createState() => _InputBarangPageState();
}

class _InputBarangPageState extends State<InputBarangPage> {
  String? selectedKategori;
  final List<String> kategoriList = [
    'Pakaian',
    'Perabot Rumah Tangga',
    'Mainan Anak',
    'Peralatan Kesehatan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detail barang',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Image and Title
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/homepage/banjirbandang.jpg',
                    width: 100,  // Increased from 60
                    height: 100,  // Increased from 60
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Bantuan korban banjir bandang di manado',
                    style: TextStyle(
                      fontSize: 25,  
                      fontWeight: FontWeight.bold,
                      height: 1.2,  
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Form Fields
            _buildInputLabel('Nama Barang :'),
            _buildTextField(),
            const SizedBox(height: 16),
            
            _buildInputLabel('Kondisi Barang :'),
            _buildTextField(),
            const SizedBox(height: 16),
            
            _buildInputLabel('Jumlah Barang :'),
            _buildTextField(),
            const SizedBox(height: 16),
            
            _buildInputLabel('Kategori Barang :'),
            _buildDropdownField(),
            const SizedBox(height: 16),
            
            _buildInputLabel('Estimasi Berat Barang :'),
            _buildTextField(),
            const SizedBox(height: 16),
            
            _buildInputLabel('Foto Barang :'),
            _buildImagePicker(),
            const SizedBox(height: 24),
            
            // Konfirmasi Button
            SizedBox(
              width: double.infinity,
              height: 45,  // Slightly reduced height
              child: ElevatedButton(
                onPressed: () {
                       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PickupConfirmationScreen(),
        ),
        );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0EBE7F),  // Updated color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),  // Updated radius
                  ),
                ),
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: TextStyle(
          color: Color(0xFF0EBE7F),  // Updated color
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return SizedBox(
      height: 45,  // Reduced height
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),  // Updated radius
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),  // Updated radius
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),  // Adjusted padding
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      height: 45,  // Reduced height
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),  // Updated radius
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedKategori,
          isExpanded: true,
          hint: const Text('Pilih kategori'),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          items: kategoriList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedKategori = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Container(
      height: 160,  // Slightly reduced height
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),  // Updated radius
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image_outlined, color: Colors.grey),
            const SizedBox(height: 6),  // Reduced spacing
            const Text(
              'Choose a file or drag & drop it here',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 2),  // Reduced spacing
            const Text(
              'JPEG, PNG and PDF up to 10MB',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            TextButton(
              onPressed: () {
                // Handle file browse action
              },
              child: const Text(
                'Browse File',
                style: TextStyle(color: Color(0xFF0EBE7F)),  // Updated color
              ),
            ),
          ],
        ),
      ),
    );
  }
}