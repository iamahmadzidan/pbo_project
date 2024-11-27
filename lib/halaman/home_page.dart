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
            const SizedBox(height: 10),
            builText(),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildHorizontalScroll(),
            ),
            const SizedBox(height: 20),
            buildHost() // Tambahkan jarak jika diperlukan
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
                  "Batman ",
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
                'assets/image/batman.jpeg',
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
    // Data untuk setiap event
    final List<Map<String, dynamic>> eventData = [
      {
        "image": 'assets/image/image6.jpg',
        "title": 'Clean up Trash\nHero Jakarta\nKe-174',
        "date": '1 Dec 2024',
        "location": 'DKI Jakarta',
        "exp": 'EXP+100',
      },
      {
        "image": 'assets/image/image2.jpg',
        "title": 'Planting Trees\nHero Bandung\nKe-45',
        "date": '5 Dec 2024',
        "location": 'Bandung, Jawa Barat',
        "exp": 'EXP+200',
      },
      {
        "image": 'assets/image/image3.jpg',
        "title": 'Beach Cleanup\nHero Bali\nKe-78',
        "date": '10 Dec 2024',
        "location": 'Bali',
        "exp": 'EXP+300',
      },
      {
        "image": 'assets/image/image4.jpg',
        "title": 'Recycle Drive\nHero Surabaya\nKe-30',
        "date": '15 Dec 2024',
        "location": 'Surabaya',
        "exp": 'EXP+150',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: eventData.map((event) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: _buildEventWidget(
              image: event['image'],
              title: event['title'],
              date: event['date'],
              location: event['location'],
              exp: event['exp'],
            ),
          );
        }).toList(),
      ),
    );
  }

// Widget yang fleksibel dengan parameter
  Widget _buildEventWidget({
    required String image,
    required String title,
    required String date,
    required String location,
    required String exp,
  }) {
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
          // Image (Circular) + Title
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 2, // Membatasi maksimal 2 baris
                  overflow: TextOverflow.ellipsis, // Teks yang meluap akan diberi ...
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Teks tambahan (misalnya tanggal atau lokasi)
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  date,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Tombol atau informasi lainnya
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                exp,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Tambahkan aksi saat tombol ditekan
                },
                child: const Text('More Info'),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget builText_1() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0), // Margin kiri dan kanan
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat jarak antara kedua teks
      children: [
        // Teks kiri
        Text(
          'Popular Host',
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

 Widget buildHost() {
  // Daftar gambar dan teks untuk setiap item
  final List<Map<String, String>> items = [
    {
      'image': 'assets/image/image1.jpg',
      'text': 'Trash World',
    },
    {
      'image': 'assets/image/image2.jpg',
      'text': 'YAI',
    },
    {
      'image': 'assets/image/image3.jpg',
      'text': 'Ant Charity',
    },
    {
      'image': 'assets/image/image4.jpg',
      'text': 'Clean up Trash 4',
    },
    {
      'image': 'assets/image/image5.jpg',
      'text': 'HIVE',
    },
    {
      'image': 'assets/image/image6.jpg',
      'text':'WWF',
    },
    {
      'image': 'assets/image/image7.jpg',
      'text': 'Indo Relawan',
    },
    {
      'image': 'assets/image/image8.jpg',
      'text': 'Pandawara group',
    },
  ];

  return GridView.builder(
    itemCount: items.length, // Jumlah item berdasarkan daftar items
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Jumlah kolom
      mainAxisExtent: 238, // Tinggi maksimum setiap item
      crossAxisSpacing: 15, // Jarak horizontal antar item
      mainAxisSpacing: 24, // Jarak vertikal antar item
    ),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(), // Non-scrollable
    itemBuilder: (context, index) {
      // Widget untuk setiap item
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Konten ke tengah secara vertikal
            children: [
              // Gambar berbentuk lingkaran
              ClipOval(
                child: Image.asset(
                  items[index]['image']!, // Gambar berdasarkan indeks
                  width: 100, // Ukuran lebar gambar
                  height: 100, // Ukuran tinggi gambar
                  fit: BoxFit.cover, // Memastikan gambar terpotong dengan baik dalam lingkaran
                ),
              ),
              const SizedBox(height: 12), // Jarak antara gambar dan teks
              // Teks di bawah gambar
              Text(
                items[index]['text']!, // Teks berdasarkan indeks
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}





