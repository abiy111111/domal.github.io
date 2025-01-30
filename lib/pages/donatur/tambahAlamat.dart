import 'package:flutter/material.dart';

class TambahAlamat extends StatefulWidget {
  const TambahAlamat({Key? key}) : super(key: key);

  @override
  State<TambahAlamat> createState() => _TambahAlamatState();
}

class _TambahAlamatState extends State<TambahAlamat> {
  final Color themeColor = const Color(0xFF0EBE7F);
  int? selectedAddressIndex;
  
  // Sample address data - replace with your actual data model
  final List<Map<String, String>> addresses =  [
  {
    'name': 'John Doe',
    'phone': '(+62) 812-3456-7890',
    'address': 'Jalan Merdeka No. 123, RT 01/RW 02, Kelurahan Sejahtera',
    'location': 'JAKARTA SELATAN, DKI JAKARTA ID 12140',
    'type': 'Utama'
  },
  {
    'name': 'Jane Smith',
    'phone': '(+62) 878-9012-3456',
    'address': 'Apartemen Green Valley Tower A-12-05, Jalan Gatot Subroto',
    'location': 'JAKARTA PUSAT, DKI JAKARTA ID 10270',
    'type': ''
  },
  {
    'name': 'Ahmad Rahman',
    'phone': '(+62) 821-3456-7890',
    'address': 'Komplek Permata Hijau Blok B2 No. 15, Jalan Kebon Jeruk',
    'location': 'BANDUNG, JAWA BARAT ID 40115',
    'type': 'Kantor'
  },
  {
    'name': 'Sarah Wilson',
    'phone': '(+62) 856-7890-1234',
    'address': 'Perumahan Griya Indah Blok F7 No. 22, Jalan Pahlawan',
    'location': 'SURABAYA, JAWA TIMUR ID 60115',
    'type': ''
  },
  {
    'name': 'Michael Chen',
    'phone': '(+62) 811-2345-6789',
    'address': 'Ruko Golden Business Park No. 8, Jalan Raya Serpong',
    'location': 'TANGERANG SELATAN, BANTEN ID 15310',
    'type': 'Bisnis'
  },
  {
    'name': 'Linda Kusuma',
    'phone': '(+62) 877-8901-2345',
    'address': 'Jalan Diponegoro No. 45, RT 03/RW 04, Kelurahan Damai',
    'location': 'MEDAN, SUMATERA UTARA ID 20123',
    'type': ''
  }
];
  void _addNewAddress() {
    // Navigate to new address form
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewAddressForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Pilih Alamat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: selectedAddressIndex == index 
                            ? themeColor 
                            : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: RadioListTile(
                      value: index,
                      groupValue: selectedAddressIndex,
                      onChanged: (int? value) {
                        setState(() {
                          selectedAddressIndex = value;
                        });
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                address['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Ubah',
                                style: TextStyle(
                                  color: themeColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            address['phone']!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            address['address']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            address['location']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          if (address['type']!.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    address['type']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                      activeColor: themeColor,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                icon: Icon(Icons.add_circle_outline, color: themeColor),
                label: Text(
                  'Tambah Alamat Baru',
                  style: TextStyle(color: themeColor),
                ),
                onPressed: _addNewAddress,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: themeColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New Address Form widget
class NewAddressForm extends StatefulWidget {
  const NewAddressForm({Key? key}) : super(key: key);

  @override
  State<NewAddressForm> createState() => _NewAddressFormState();
}

class _NewAddressFormState extends State<NewAddressForm> {
  // ... rest of the existing code for NewAddressFormState
  final _formKey = GlobalKey<FormState>();
  final Color themeColor = const Color(0xFF0EBE7F);
  bool isHome = true;
  bool isOffice = false;
  bool isOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Alamat Baru',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.1),
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/400x150'),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: themeColor, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    'Alamat Pengiriman Donasi',
                    style: TextStyle(
                      color: themeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Label Alamat',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _buildAddressType(
                                'Rumah',
                                Icons.home,
                                isHome,
                                () => setState(() {
                                  isHome = true;
                                  isOffice = false;
                                  isOther = false;
                                }),
                              ),
                              const SizedBox(width: 12),
                              _buildAddressType(
                                'Kantor',
                                Icons.business,
                                isOffice,
                                () => setState(() {
                                  isHome = false;
                                  isOffice = true;
                                  isOther = false;
                                }),
                              ),
                              const SizedBox(width: 12),
                              _buildAddressType(
                                'Lainnya',
                                Icons.place,
                                isOther,
                                () => setState(() {
                                  isHome = false;
                                  isOffice = false;
                                  isOther = true;
                                }),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildInputField(
                            'Nama Lengkap',
                            Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            'Nomor Handphone',
                            Icons.phone_android,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nomor handphone tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            'Alamat Lengkap',
                            Icons.home_work,
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Alamat tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildInputField(
                                  'RT',
                                  null,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildInputField(
                                  'RW',
                                  null,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            'Kode Pos',
                            Icons.local_post_office,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
child: const Text(
  'Simpan Alamat',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Warna font diubah menjadi putih
  ),
),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressType(
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? themeColor.withOpacity(0.1) : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? themeColor : Colors.grey[300]!,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? themeColor : Colors.grey[600],
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? themeColor : Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    IconData? icon, {
    int maxLines = 1,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, color: themeColor) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: themeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}