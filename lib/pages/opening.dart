// lib/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'loginpage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      description: 'Aplikasi ini bisa memudahkan pengguna untuk berdonasi kepada pihak yang membutuhkan dan menciptakan ladang pahala untuk berbuat kebaikan',
    ),
    OnboardingContent(
      description: 'Kami membuat aplikasi ini dengan alasan yaitu bisa membantu orang yang tidak mampu,terlantar dan juga membantu anak yatim atau anak berkebutuhan khusus dan kita berharap kita bisa kerja sama seperti yayasan yayasan terkait.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fixed Background Image
          Image.asset(
            'assets/openingimage.jpg',
            fit: BoxFit.cover,
          ),
          // Bottom Rectangle with Gradient
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  stops: const [0.4, 0.8, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/opening.png',
                    height: 80,
                    width: 274.02,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return const Text('Gagal memuat gambar', 
                        style: TextStyle(color: Colors.white));
                    },
                  ),
                ),
                const Spacer(),
                // Content area with fixed height
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: screenHeight * 0.35,
                    minHeight: 0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // PageView untuk text
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: _contents.length,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                _contents[index].description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Page Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _contents.length,
                          (index) => buildDot(index),
                        ),
                      ),
                      // Skip Button
                      if (_currentPage == 1) ...[
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Lewati',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                      SizedBox(height: bottomPadding + 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    );
  }
}

class OnboardingContent {
  final String description;

  OnboardingContent({
    required this.description,
  });
}
