import 'package:flutter/material.dart';
import 'halaman/home_page.dart';
import 'halaman/activity_page.dart';
import 'halaman/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volunteer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const _MainNavigation(), // Make sure this matches the private widget
    );
  }
}

class _MainNavigation extends StatefulWidget {
  // Private StatefulWidget
  const _MainNavigation();

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<_MainNavigation> {
  // Private State class
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ActivityPage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
