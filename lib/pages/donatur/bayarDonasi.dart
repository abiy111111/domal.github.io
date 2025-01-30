import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:confetti/confetti.dart';
import 'homepageDonatur.dart';


class BayarDonasi extends StatefulWidget {
  final String selectedPaymentMethod;

  const BayarDonasi({
    super.key,
    required this.selectedPaymentMethod,
  });

  @override
  _BayarDonasiState createState() => _BayarDonasiState();
}

class _BayarDonasiState extends State<BayarDonasi> {
  final TextEditingController _amountController = TextEditingController();
  bool isLoading = false;
  final Color themeColor = const Color(0xFF0EBE7F);
  List<int> quickAmounts = [10000, 20000, 50000, 100000, 200000, 500000];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _selectQuickAmount(int amount) {
    _amountController.text = amount.toString();
  }

  void _proceedToPayment() {
    final amount = int.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Masukkan nominal yang valid'),
          backgroundColor: themeColor,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmation(
            selectedPaymentMethod: widget.selectedPaymentMethod,
            amount: amount,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masukkan Nominal Donasi',
          style: TextStyle(color: themeColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: themeColor), // Makes back button green
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nominal Donasi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: 'Rp 0',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: themeColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: themeColor, width: 2),
                          ),
                          prefixIcon: Icon(Icons.attach_money, color: themeColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Pilihan Cepat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: quickAmounts.map((amount) => OutlinedButton(
                  onPressed: () => _selectQuickAmount(amount),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: themeColor,
                    side: BorderSide(color: themeColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(amount),
                  ),
                )).toList(),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Metode Pembayaran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: themeColor.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/${widget.selectedPaymentMethod}.png',
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.selectedPaymentMethod.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.check_circle, color: themeColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _proceedToPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Lanjutkan Pembayaran',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
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

class PaymentConfirmation extends StatelessWidget {
  final String selectedPaymentMethod;
  final int amount;
  final Color themeColor = const Color(0xFF0EBE7F);

  const PaymentConfirmation({
    super.key,
    required this.selectedPaymentMethod,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String transactionId = 'TRX${now.millisecondsSinceEpoch}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konfirmasi Pembayaran',
          style: TextStyle(color: themeColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: themeColor), // Makes back button green
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: themeColor,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.volunteer_activism,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(amount),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Transaksi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildDetailRow('ID Transaksi', transactionId),
                          _buildDetailRow('Tanggal', DateFormat('dd MMMM yyyy HH:mm').format(now)),
                          _buildDetailRow('Status', 'Menunggu Pembayaran'),
                          _buildDetailRow('Metode', selectedPaymentMethod.toUpperCase()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rincian Pembayaran',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildDetailRow('Nominal Donasi',
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(amount)
                          ),
                          _buildDetailRow('Biaya Admin', 'Rp 0'),
                          const Divider(),
                          _buildDetailRow(
                            'Total Pembayaran',
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(amount),
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
// Replace the existing ElevatedButton in PaymentConfirmation class with this:
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      // Navigate to thank you animation
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => ThankYouAnimation(
            amount: amount,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: themeColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: const Text(
      'Konfirmasi Pembayaran',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  ),
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ThankYouAnimation extends StatefulWidget {
  final int amount;

  const ThankYouAnimation({Key? key, required this.amount}) : super(key: key);

  @override
  State<ThankYouAnimation> createState() => _ThankYouAnimationState();
}

class _ThankYouAnimationState extends State<ThankYouAnimation>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _fadeController;
  late Animation<double> _imageAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  final Color themeColor = const Color(0xFF0EBE7F);
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _imageAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.elasticInOut),
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );

    _rotationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    Future.delayed(const Duration(milliseconds: 500), () => _confettiController.play());

    // Update the navigation logic
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        // Navigate to HomepageDonatur and remove all previous routes
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomepageDonatur(),
          ),
          (route) => false, // This will remove all previous routes
        );
      }
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _fadeController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: [themeColor, Colors.pink, Colors.yellow, Colors.blue],
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _imageAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _imageAnimation.value,
                      child: Image.asset('assets/donately.png', height: 100),
                    );
                  },
                ),
                const SizedBox(height: 40),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Text(
                    'Terima Kasih!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Text(
                    'Donasi sebesar',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 10),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Text(
                    NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                        .format(widget.amount),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Semoga kebaikan Anda dibalas berlipat ganda',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
}