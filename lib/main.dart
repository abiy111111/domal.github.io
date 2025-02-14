import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domalapp/pages/opening.dart';
import 'package:domalapp/pages/donatur/homepageDonatur.dart';
import 'package:domalapp/pages/pengelola/homepagePengelola.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomepageDonatur(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Animasi logo
              FadeTransition(
                opacity: _animation,
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/donately.png', // Logo utama
                    width: 221, // Ukuran diperbesar dari 200 ke 300
                    height: 158, // Ukuran diperbesar dari 200 ke 300
                  ),
                ),
              ),
              const Spacer(),
              const SimetryaGroupText(), // Gunakan widget bersama di sini
            ],
          ),
        ),
      ),
    );
  }
}

// Widget bersama untuk teks Simetrya Group
class SimetryaGroupText extends StatelessWidget {
  const SimetryaGroupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        'Simetrya Group',
        style: GoogleFonts.dmSerifText(
          textStyle: TextStyle(
            color: Colors.green[800],
            fontSize: 16,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                offset: const Offset(0, 4), // y = 4
                blurRadius: 4, // blur = 4
                color: Colors.black.withOpacity(0.25), // standar opacity shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman berikutnya
class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _fadeOutAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.4,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    ));

    _fadeOutAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();

      // Menavigasi ke OpeningPage setelah animasi selesai
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          Tween<double>(
                            begin: 0,
                            end: -100,
                          ).evaluate(_slideAnimation),
                          0,
                        ),
                        child: Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Image.asset(
                            'assets/donately.png',
                            width: 100, // Ukuran disesuaikan
                            height: 50, // Ukuran disesuaikan
                          ),
                        ),
                      );
                    },
                  ),
                  Transform.translate(
                    offset: const Offset(40, 0), // Kurangi jarak
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Domal',
                            style: GoogleFonts.rozhaOne(
                              color: const Color(0xff2F614D),
                              fontSize: 48,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text('membantu sesama manusia',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff2F614D),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400)),
                        ],
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
}
