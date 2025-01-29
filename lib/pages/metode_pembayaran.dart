import 'package:flutter/material.dart';
import 'donatur/bayarDonasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Options',
      home: PaymentOptionsScreen(),
    );
  }
}

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

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
        title: const Text('Payment Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Payment Method',
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
            ElevatedButton(
              onPressed: selectedPaymentMethod != null
                  ? () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BayarDonasi(
                            selectedPaymentMethod: selectedPaymentMethod!,
                          ),
                        ),
                      );
                    }
                  : null,
                  
              child: const Text('Proceed to Payment'),
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

  const PaymentMethodTile({super.key, 
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
            color: isSelected ? Colors.green : Colors.grey[300]!,
            width: isSelected ? 2.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath,
              width: 48.0,
              height: 48.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.green : null,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24.0,
              ),
          ],
        ),
      ),
    );
  }
}