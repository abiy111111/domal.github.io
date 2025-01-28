import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan ini

class BuatLaporan extends StatefulWidget {
  @override
  _BuatLaporanState createState() => _BuatLaporanState();
}

class _BuatLaporanState extends State<BuatLaporan> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  String _deskripsi = '';
  String _jumlahDana = '';
  String _jumlahBarang = '';
  String _lokasi = '';
  String _dokumentasiUrl = '';

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0EBE7F);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Laporan Donasi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal di salurkan',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  }
                },
                child: TextFormField(
                  controller: TextEditingController(
                    text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                  ),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Deskripsi',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _deskripsi = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah Dana',
                          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _jumlahDana = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah Barang',
                          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _jumlahBarang = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Masukkan lokasi di salurkannya',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _lokasi = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Dokumentasi',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  // Implement file picker logic here
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose a file or drag & drop it here',
                        style: TextStyle(color: primaryColor),
                      ),
                      Icon(Icons.attach_file, color: primaryColor),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement cancel logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Text(
                      'BATAL',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement save logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      'SIMPAN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
