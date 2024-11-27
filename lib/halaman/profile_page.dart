import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  String _name = "Dreamybullxxx";
  String _age = "19 Tahun";
  String _job = "Collage Student";
  String _location = "Somba Opu, Reg.Gowa";
  bool _isFaqExpanded = false;

  void _editProfile() {
    TextEditingController nameController = TextEditingController(text: _name);
    TextEditingController ageController = TextEditingController(text: _age);
    TextEditingController jobController = TextEditingController(text: _job);
    TextEditingController locationController = TextEditingController(text: _location);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Profil"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(labelText: "Nama")),
              const SizedBox(height: 10),
              TextField(controller: ageController, decoration: const InputDecoration(labelText: "Umur")),
              const SizedBox(height: 10),
              TextField(controller: jobController, decoration: const InputDecoration(labelText: "Pekerjaan")),
              const SizedBox(height: 10),
              TextField(controller: locationController, decoration: const InputDecoration(labelText: "Domisili")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Batal")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _name = nameController.text;
                _age = ageController.text;
                _job = jobController.text;
                _location = locationController.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color(0xFF3DABF0),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            color: const Color(0xFF3DABF0),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -100,
                  left: 16,
                  right: 16,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      height: 180,
                      child: Row(
                        children: [
                          Container(
                            width: 130,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/image/profilepicture.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  _name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _age,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  _job,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                Text(
                                  _location,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextButton(
                                    onPressed: _editProfile,
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                    ),
                                    child: const Text("Edit Profil"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 100,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        // Tombol FAQ
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isFaqExpanded = !_isFaqExpanded;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('F.A.Q.'),
                        ),
                        // Konten Dropdown FAQ
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: _isFaqExpanded
                              ? Container(
                            padding: const EdgeInsets.all(16),
                            color: Colors.grey[200],
                            child: const Text(
                              '(Cari sendiri jawabannya)\n'
                              'F.A.Q. - Frequently Asked Questions\n\n'
                                  '1. Bagaimana cara mengubah profil?\n'
                                  '2. Apa yang terjadi jika saya lupa logout?\n'
                                  '3. Bagaimana cara menghubungi support?',
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 10),
                        // Tombol Logout
                        ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika logout
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Logout'),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
