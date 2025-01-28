import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatefulWidget {
  final Function(String)? onPaymentSelected; // Callback for when payment is confirmed
  final double? amount; // Optional amount to display

  const PaymentOptionsScreen({
    super.key,
    this.onPaymentSelected,
    this.amount,
  });

  @override
  _PaymentOptionsScreenState createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  final Map<String, dynamic> paymentMethods = {
    'qris': {'name': 'QRIS', 'logo': 'assets/QRIS.png'},
    'ovo': {'name': 'OVO', 'logo': 'assets/OVO.png'},
    'dana': {'name': 'DANA', 'logo': 'assets/DANA.png'},
    'shopeepay': {'name': 'ShopeePay', 'logo': 'assets/Shopee pay.png'},
    'gopay': {'name': 'GoPay', 'logo': 'assets/gopay.png'},
    'bca': {'name': 'BCA', 'logo': 'assets/bca.png'},
    'bri': {'name': 'BRI', 'logo': 'assets/bri.png'},
    'bsi': {'name': 'BSI', 'logo': 'assets/bsi.png'},
  };

  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pilih Metode Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.amount != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Rp ${widget.amount?.toStringAsFixed(0) ?? '0'}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
            ],
            const Text(
              'Metode Pembayaran',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.separated(
                itemCount: paymentMethods.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12.0),
                itemBuilder: (context, index) {
                  final entry = paymentMethods.entries.toList()[index];
                  return PaymentMethodTile(
                    id: entry.key,
                    name: entry.value['name'],
                    logoPath: entry.value['logo'],
                    isSelected: entry.key == selectedPaymentMethod,
                    onTap: () {
                      setState(() {
                        selectedPaymentMethod = entry.key;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedPaymentMethod != null
                    ? () {
                        if (widget.onPaymentSelected != null) {
                          widget.onPaymentSelected!(selectedPaymentMethod!);
                        }
                        Navigator.pop(context, selectedPaymentMethod);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0EBE7F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Lanjutkan Pembayaran',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String id;
  final String name;
  final String logoPath;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.id,
    required this.name,
    required this.logoPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF0EBE7F) : Colors.grey[300]!,
            width: isSelected ? 2.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Image.asset(
              logoPath,
              width: 48.0,
              height: 48.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFF0EBE7F) : null,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF0EBE7F),
                size: 24.0,
              ),
          ],
        ),
      ),
    );
  }
}