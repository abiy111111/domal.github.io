import 'package:flutter/material.dart';
import 'dart:async';
import '../pencarian.dart';
import '../lihatsemua.dart';
import '../toogglePage.dart';
import 'notifikasiAdmin.dart';
import 'userList.dart';
import 'historyAdmin.dart';
import 'profileAdmin.dart';

class HomepageAdmin extends StatefulWidget {
  const HomepageAdmin({super.key});

  @override
  _HomepageAdminState createState() => _HomepageAdminState();
}

class _HomepageAdminState extends State<HomepageAdmin> {
  int _currentBackgroundIndex = 0;
  int _selectedIndex = 0;
  final List<String> backgroundImages = [
    'assets/homepage/1.jpg',
    'assets/homepage/2.jpg',
    'assets/homepage/3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentBackgroundIndex = (_currentBackgroundIndex + 1) % backgroundImages.length;
      });
    });
  }

  Widget _buildTopBar() {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TogglePage()),
                );
              },
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: const TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF677294),
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),
            ),
           IconButton(
  icon: const Icon(Icons.notifications, color: Colors.white, size: 28),
  padding: EdgeInsets.zero,
  constraints: const BoxConstraints(),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const NotifikasiAdmin()),
    );
  },
),

          ],
        ),
      ),
    );
  }

void _onItemTapped(int index) {
  if (index == 0) {
    setState(() {
      _selectedIndex = index;
    });
  } else if (index == 1) {
    // Navigate to UserList page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserList()),
    );
  } else if (index == 2) {
    // Navigate to History page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HistoryAdmin()),
    );
  } else if (index == 3) {
    // Navigate to Profile page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileAdmin()),
    );
  } else {
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
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    backgroundImages[_currentBackgroundIndex],
                    key: ValueKey<int>(_currentBackgroundIndex),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
              ],
            ),
          ),
          
          Column(
            children: [
              _buildTopBar(),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo Admin!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Selamat Datang',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEF1F2),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/homepage/gambarawal.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _buildCards(context),
                            ),
                          ],
                        ),
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LihatSemuaScreen()),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 16.0, right: 16.0, bottom: 16.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Lihat semua',
                              style: TextStyle(
                                color: Color(0xFF0EBE7F),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: DonationCard(),
                      ),
                      
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
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

  List<Widget> _buildCards(BuildContext context) {
    final cardData = [
      {'image': 'assets/homepage/batin.jpg', 'title': 'Verifikasi Pengelola'},
      {'image': 'assets/homepage/dosis.jpg', 'title': 'Kelola Pengguna'},
      {'image': 'assets/homepage/baris.jpg', 'title': 'Laporan Donasi'},
    ];

    return cardData.map((data) => Container(
      width: (MediaQuery.of(context).size.width - 64) / 3,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          image: AssetImage(data['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(1.0)],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Text(
                  data['title']!,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    height: 1.2,
                    color: Color(0xFFEBEBEB),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    )).toList();
  }
}

class DonationCard extends StatelessWidget {
  const DonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'assets/homepage/banjirbandang.jpg',
                  width: 80,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Donasi Korban Banjir Bandang di manado',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF404345),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 12,
                          color: Color(0xFF677294),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Posted by: @johndoe123',
                            style: TextStyle(
                              color: Color(0xFF677294),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'terkumpul',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '8.510.000',
                                style: TextStyle(
                                  color: Color(0xFF404345),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0EBE7F),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '75.0%',
                                    style: TextStyle(
                                      color: Color(0xFF677294),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '67 donator Stories',
                                style: TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Target',
                      style: TextStyle(
                        color: Color(0xFF677294),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '11.000.000',
                      style: TextStyle(
                        color: Color(0xFF404345),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0EBE7F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  minimumSize: const Size(0, 32),
                ),
                child: const Text(
                  'Lihat Detail',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}