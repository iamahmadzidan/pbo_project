import 'package:flutter/material.dart';
import 'activity_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF099AF5),
        automaticallyImplyLeading: false, // Menghilangkan ikon back default
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              // Kolom untuk teks "Welcome back!" dan nama pengguna
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Bruce Wayne T",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Gambar profil yang bulat
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/image/ryou.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          Expanded(
            child: Center(
              child: Text("Home Content"),
            ),
          ),
        ],
      ),
    ),
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
     
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
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
