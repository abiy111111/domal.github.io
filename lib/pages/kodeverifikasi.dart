import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'homepagePengelola.dart';

class KodeVerifikasi extends StatefulWidget {
  const KodeVerifikasi({Key? key}) : super(key: key);

  @override
  State<KodeVerifikasi> createState() => _KodeVerifikasiState();
}

class _KodeVerifikasiState extends State<KodeVerifikasi> {
  int _timeLeft = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Donately Logo
              Center(
                child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/donately.png',
                  width: 143,
                  height: 125,
                ),
              ),
              ),
              const SizedBox(height: 24),
              // Confirmation Account Text
              const Text(
                'Confirmation Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  color: Color(0xFF677294),
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              const Text(
                'Enter the verification code we\'ve sent to your email',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Color(0xFF677294),
                ),
              ),
              const SizedBox(height: 24),
              // Verification Code Text
              const Text(
                'Verifikasi code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Rubik',
                  color: Color(0xFF677294),
                ),
              ),
              const SizedBox(height: 12),
              // Verification Code Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE5E5E5)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Timer Text
              Center(
                child: Text(
                  '00:${_timeLeft.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Rubik',
                    color: Color(0xFF677294),
                  ),
                ),
              ),
              const Spacer(),
             // Send Button
Padding(
  padding: const EdgeInsets.only(bottom: 24),
  child: SizedBox(
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomepagePengelola()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4CAF50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'send',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
