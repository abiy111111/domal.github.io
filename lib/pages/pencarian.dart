import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> suggestionChips = [
    'Pembangunan masjid',
    'donasi korban bencana',
    'Renovasi rumah tahfidz',
    'donasi anak terlantar',
    'donasi anak yatim/piatu',
    'Sumbangan untuk penggiat kanker',
    'donasi rutin',
  ];

  final List<String> recentSearches = [
    'donasi korban bencana',
    'donasi korban bencana',
    'donasi korban bencana',
    'donasi korban bencana',
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: [
          // Background image with responsive sizing
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/Vector 5.png',
              width: screenSize.width,
              // Make height responsive to screen height
              height: screenSize.height * 0.45, // 45% of screen height
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // Min height to ensure content fills screen
                constraints: BoxConstraints(
                  minHeight: screenSize.height - MediaQuery.of(context).padding.top,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Row with Back Button
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Color(0xFF677294)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _searchController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: 'Apa yang sedang anda cari?',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF677294),
                                    fontSize: 14,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xFF677294),
                                    size: 20,
                                  ),
                                  suffixIcon: _searchController.text.isNotEmpty
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Color(0xFF677294),
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _searchController.clear();
                                            });
                                          },
                                        )
                                      : null,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Suggestion Chips with responsive padding
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.02,
                        ),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: suggestionChips.map((suggestion) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _searchController.text = suggestion;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  suggestion,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF677294),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Recent Searches
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Terakhir Dilihat',
                              style: TextStyle(
                                color: Color(0xFF677294),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...recentSearches.map((search) {
                            return ListTile(
                              leading: const Icon(
                                Icons.history,
                                color: Color(0xFF677294),
                              ),
                              title: Text(
                                search,
                                style: const TextStyle(
                                  color: Color(0xFF677294),
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _searchController.text = search;
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}