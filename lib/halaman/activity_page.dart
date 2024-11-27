import 'package:flutter/material.dart';
import 'saved_page.dart';
import 'history_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _selectedTabIndex = 0; // Index untuk top navbar

  final List<Widget> _pages = [
    const SavedPage(), // Halaman Saved
    const HistoryPage(), // Halaman History
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Journey'),
        backgroundColor: const Color(0xFF3DABF0), // Warna biru
      ),
      body: Column(
        children: [
          const SizedBox(height: 25), // Jarak antara app bar dan top navbar
          // Top Navbar
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // Lebar 90% layar
              decoration: BoxDecoration(
                color: Colors.grey[300], // Warna abu-abu latar bar
                borderRadius: BorderRadius.circular(30), // Rounded edges
              ),
              child: Row(
                children: [
                  _buildTopNavButton('Saved', 0),
                  _buildTopNavButton('History', 1),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16), // Jarak antara navbar dan konten
          // Konten halaman sesuai tab
          Expanded(
            child: _pages[_selectedTabIndex],
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol top navbar
  Widget _buildTopNavButton(String label, int index) {
    final bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF3DABF0) : Colors.grey[300],
            borderRadius: BorderRadius.circular(35),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
