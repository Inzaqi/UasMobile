import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'login_page.dart';

class ProfileMenu extends StatelessWidget {
  final String token;
  final String email;

  ProfileMenu({required this.token, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F47), // Background utama
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1F47),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("images/sleepy2.png"), // Avatar
          ),
          SizedBox(height: 20),

          // Informasi dan tombol "Lihat profil tidur"
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF27296D), // Background biru tua
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  'Untuk hasil analisa yang lebih baik, akurat, dan bermanfaat. '
                  'Profil tidur hanya bisa diakses setelah kamu melakukan pelacakan '
                  'tidur paling tidak 30 hari.',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Lihat profil tidur',),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Menu List dengan background
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFF27296D), // Background biru tua
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _buildMenuItem(
                  context,
                  title: 'Detail profil',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          token: token,
                          email: email,
                        ),
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white24),
                _buildMenuItem(
                  context,
                  title: 'Terms & Conditions',
                  icon: Icons.description,
                  onTap: () {
                    // Aksi untuk Terms & Conditions
                  },
                ),
                Divider(color: Colors.white24),
                _buildMenuItem(
                  context,
                  title: 'Feedback',
                  icon: Icons.feedback,
                  onTap: () {
                    // Aksi untuk Feedback
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Tombol Logout
          ElevatedButton(
            onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1E1F47),
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.white70,
        currentIndex: 2, // Index tab aktif
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Jurnal Tidur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nightlight_round),
            label: 'Sleep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onTap,
    );
  }
}
