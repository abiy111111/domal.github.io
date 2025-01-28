import 'package:flutter/material.dart';
import 'homepageAdmin.dart';
import 'userList.dart';
import 'historyAdmin.dart';

class ProfileAdmin extends StatefulWidget {
  const ProfileAdmin({super.key});

  @override
  _ProfileAdminState createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  int _selectedIndex = 3; 

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to Homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomepageAdmin()),
      );
    } else if (index == 1) {
      // Navigate to UserList
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserList()),
      );
    } else if (index == 2) {
      // Navigate to History
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HistoryAdmin()),
      );
    } else if (index == 3) {
      // Already on Profile page
      setState(() {
        _selectedIndex = index;
      });
    }
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildStatColumn('Verifikasi Pengelola', '12'),
    _buildStatColumn('Pengguna Aktif', '500'),
    _buildStatColumn('Total Kampanye', '150'),
  ],
                ),
                const SizedBox(height: 20),
                // admin
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
                        'ADMIN',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/formkit_people.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 1 ? const Color(0xFF0EBE7F) : Colors.grey,
            ),
            label: 'User List',
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
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}