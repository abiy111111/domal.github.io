// togglePage.dart
import 'package:flutter/material.dart';
import 'dart:ui';
import 'loginpage.dart';
import 'privacyPolicy.dart';
import 'helpCenter.dart';
import 'setting.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          AppDrawerContent(),
        ],
      ),
    );
  }
}

class AppDrawerContent extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.person,
      'label': 'My Profile',
      'onTap': (BuildContext context) {
        // Add profile page navigation
      }
    },
    {
      'icon': Icons.history,
      'label': 'History',
      'onTap': (BuildContext context) {
        // Add history page navigation
      }
    },
    {
      'icon': Icons.payment,
      'label': 'Payments',
      'onTap': (BuildContext context) {
        // Add payments page navigation
      }
    },
    {
      'icon': Icons.privacy_tip,
      'label': 'Privacy & Policy',
      'onTap': (BuildContext context) {
                 Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
         );
      }
    },
    {
      'icon': Icons.help,
      'label': 'Help Center',
      'onTap': (BuildContext context) {
                 Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HelpCenterPage()),
         );
      }
    },
    {
      'icon': Icons.settings,
      'label': 'Settings',
      'onTap': (BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(userRole: UserRole.donatur),

      ),
    );
      }
    },
    {
      'icon': Icons.logout,
      'label': 'Logout',
      'onTap': (BuildContext context) {
         Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
         );
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header row with profile and close button
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile section
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF0EBE7F),
                      child: Icon(Icons.person, size: 30, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rafi Adli',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '5 visits so far',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Close button
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Menu items
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      leading: Icon(item['icon'], color: Colors.white, size: 24),
                      title: Text(
                        item['label'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        if (item['onTap'] != null) {
                          item['onTap'](context);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}