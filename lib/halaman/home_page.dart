import 'package:flutter/cupertino.dart';
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
    const HomeContent(),
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

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
      body: SingleChildScrollView( // Pastikan seluruh konten di-scroll
        child: Column(
          children: [
            _buildSearch(),
            builText(),
            space(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildHorizontalScroll(),
            ),
            const SizedBox(height: 20), // Tambahkan jarak jika diperlukan
          ],
        ),
      ),
    );
  }

  // Widget untuk header
  PreferredSizeWidget _buildHeader() {
    return AppBar(
      backgroundColor: const Color(0xFF099AF5),
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
    );
  }

  // Widget untuk search bar
  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: CupertinoSearchTextField(
              controller: TextEditingController(),
              placeholder: 'Search an activity',
              prefixIcon: const Icon(
                CupertinoIcons.search,
                size: 20.0,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.exclamationmark_circle,
                size: 20,
              ),
              style: const TextStyle(fontSize: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 55,
            height: 55,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(0, 223, 213, 223), // Warna latar belakang kotak
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Membulatkan sudut
              ),
            ),
            child: Center( // Menggunakan Center agar gambar berada di tengah kotak
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1), // Membulatkan sudut gambar agar sesuai dengan container
                child: Image.asset(
                  'assets/image/image.png', // Path gambar
                  width: 18, // Ukuran gambar sesuai yang diinginkan
                  height: 20, // Ukuran gambar sesuai yang diinginkan
                  fit: BoxFit.cover, // Memastikan gambar mengisi kotak dengan baik
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk teks
  Widget builText() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0), // Margin kiri dan kanan
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat jarak antara kedua teks
      children: [
        // Teks kiri
        Text(
          'Upcoming Quests',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // Teks kanan
        Text(
          'See all', // Ganti dengan teks yang diinginkan
          style: TextStyle(fontSize: 14, color: Color(0xFF099AF5)),
        ),
      ],
    ),
  );
}

   Widget space() {
    return const Align(
      
      child: Padding(
        padding: EdgeInsets.only(left: 20.0), 
        child: Text(
          ' ',
          
        ),
      ),
    );
  }

  // Widget untuk scroll horizontal
  Widget buildHorizontalScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Scroll horizontal
      child: Row(
        children: [
          _buildEventWidget(),
          const SizedBox(width: 10),
          _buildEventWidget(),
          const SizedBox(width: 10),
          _buildEventWidget(),
          const SizedBox(width: 10),
          _buildEventWidget(),
        ],
      ),
    );
  }
  Widget _buildEventWidget() {
    return Container(
      width: 230,
      height: 232,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Title
          Row(
            children: [
              Image.asset(
                'assets/image/ryou.jpeg',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'Clean up Trash\nHero Jakarta\nKe-174',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Teks tambahan (misalnya tanggal atau lokasi)
          const Row(
            children: [
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 4),
              Text('1 Dec 2024'),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.location_on, size: 16),
              SizedBox(width: 4),
              Text('DKI Jakarta'),
            ],
          ),
          const SizedBox(height: 16),
          // Tombol atau informasi lainnya
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('EXP+100'),
              TextButton(
                onPressed: () {},
                child: const Text('More Info'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

