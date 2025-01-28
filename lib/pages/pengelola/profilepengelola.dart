import 'package:flutter/material.dart';
import '../massage.dart';
import 'homepagePengelola.dart';
import 'historyPengelolah.dart';
import 'kampanyeSaya.dart';

class PengelolaProfileScreen extends StatefulWidget {
  const PengelolaProfileScreen({super.key});

  @override
  _PengelolaProfileScreenState createState() => _PengelolaProfileScreenState();
}

class _PengelolaProfileScreenState extends State<PengelolaProfileScreen> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    if (index == 0) {
      // Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomepagePengelola()),
      );
    } else if (index == 1) {
      // Chat
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MessageScreen()),
      );
    } else if (index == 3) {
      // History
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HistoryPengelola()),
      );
    } else if (index == 4) {
      // Profile (current screen)
      return;
    }
  }

  void _navigateToKampanyeSaya() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KampanyeSaya()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/adliblur.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // White background at the bottom with gradient (25%)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.white],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Profile Picture
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/adlipr.jpg'),
                ),
                const SizedBox(height: 10),
                // Name
                const Text(
                  'rafi adli',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Phone number
                const Text(
                  '+62 704688781',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildStatColumn('Campaigns\nCreated', '5'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildStatColumn('Donations\nReceived', '1500'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildStatColumn('Total Funds\nRaised', '50000'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // DONATUR badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        'PENGELOLA',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // "Kampanye Anda" button
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: _navigateToKampanyeSaya,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:  const Color(0xFF0EBE7F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Kampanye Anda'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Info list
                _buildInfoRow(Icons.email, 'raffiadlixy@gmail.com'),
                _buildInfoRow(Icons.calendar_today, '28th/08/2008'),
                _buildInfoRow(Icons.location_on, 'Jl.pendidikan,Makassar, Indonesia'),
                const SizedBox(height: 20),
                // Instagram button
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('instagram'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
 bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0EBE7F),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFF0EBE7F),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 255, 255, 255)),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
