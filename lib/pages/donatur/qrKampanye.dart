import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:animate_do/animate_do.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({Key? key}) : super(key: key);

  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedData;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (mounted) {
      controller?.pauseCamera();
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0EBE7F), // Warna utama baru
              Color(0xFF088E5A), // Warna sekunder lebih gelap
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.white,
                        borderRadius: 20,
                        borderLength: 40,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Positioned(
                          top: MediaQuery.of(context).size.height * 0.25 +
                               (_animationController.value * 50),
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.2,
                          child: Opacity(
                            opacity: 0.7,
                            child: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: scannedData != null
                          ? FadeInUp(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hasil Scan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0EBE7F),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    scannedData!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF088E5A),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 15),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      if (scannedData != null) {
                                        Navigator.pushNamed(
                                          context, 
                                          '/kampanye', 
                                          arguments: scannedData
                                        );
                                      }
                                    },
                                    icon: const Icon(Icons.open_in_new),
                                    label: const Text('Buka Kampanye'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF0EBE7F),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              'Arahkan kamera ke QR Code',
                              style: TextStyle(
                                color: Color(0xFF0EBE7F),
                                fontSize: 16,
                              ),
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (mounted) {
        setState(() {
          scannedData = scanData.code;
        });

        if (scannedData != null) {
          controller.pauseCamera();
          Navigator.pushNamed(context, '/kampanye', arguments: scannedData);
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller?.dispose();
    super.dispose();
  }
}
