import 'package:flutter/material.dart';
import 'activity_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Home Content")),
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
    return const Scaffold(
      body: SafeArea(child: Column(
        children: [
          SizedBox(height: 22,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Welcome back!'),
                SizedBox(height: 2),
                Text(
                  "Bruce wyne T", 
                  style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold),
                
                  )
              ]
            ),
          )


    return Scaffold(
      appBar: AppBar(title: const Text("Welcome back!")),
      body: _pages[_currentIndex], // Menampilkan konten sesuai tab yang dipilih
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
