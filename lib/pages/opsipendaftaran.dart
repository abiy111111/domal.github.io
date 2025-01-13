import 'package:flutter/material.dart';
import 'pendaftarandonatur.dart';
import 'pendaftaranpengelola.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({Key? key}) : super(key: key);

  @override
  _RoleSelectionPageState createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? selectedRole;

  void _handleSubmit() {
    if (selectedRole == null) return;

    if (selectedRole == 'Donatur') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PendaftaranDonatur()),
      );
    } else if (selectedRole == 'Pengelola') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PendaftaranPengelola()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF9F9F9F).withOpacity(0.75),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -70), // Menggeser ke atas 
                  child: Column(
                    children: [
                      const Text(
                        'Join us to start searching',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Anda dapat mencari donasi, membuat galang dana,\ndan menemukan bantuan sosial',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF677294),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      radioTheme: RadioThemeData(
                        fillColor: MaterialStateProperty.all(Colors.grey[800]),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Pilih peran anda!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),
                        RadioListTile<String>(
                          title: const Text('Donatur'),
                          value: 'Donatur',
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
                          activeColor: Colors.grey[800],
                        ),
                        RadioListTile<String>(
                          title: const Text('Pengelola'),
                          value: 'Pengelola',
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
                          activeColor: Colors.grey[800],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4CAF50),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}