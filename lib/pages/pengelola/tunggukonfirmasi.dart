import 'package:flutter/material.dart';
import '../kodeverifikasi.dart';

class Tunggukonfirmasi extends StatelessWidget {
  const Tunggukonfirmasi({super.key});

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
                  offset: const Offset(0, -100),
                  child: const Column(
                    children: [
                      Text(
                        'Join us to start searching',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
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
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KodeVerifikasi(),
                        ),
                      );
                    },
                    child: Container(
                      width: 315,
                      height: 225,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Informasi!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Rubik',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tunggu sampai admin menyetujui pendaftaran mu yya...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF555555),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik',
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
        ),
      ),
    );
  }
}