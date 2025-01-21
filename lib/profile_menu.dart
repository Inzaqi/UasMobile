import 'package:flutter/material.dart';
import 'profile_page.dart';

class ProfileMenu extends StatelessWidget {
  final String token;
  final String email;

  ProfileMenu({required this.token, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text('Profile Menu'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.purple,
            child: Icon(Icons.person, color: Colors.white, size: 50),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Untuk hasil analisa yang lebih baik, akurat, dan bermanfaat. '
              'Profil tidur hanya bisa diakses setelah kamu melakukan pelacakan '
              'tidur paling tidak 30 hari.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: Text('Lihat profil tidur'),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              'Detail profil',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
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
          ListTile(
            title: Text(
              'Terms & Conditions',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
          ),
          ListTile(
            title: Text(
              'Feedback',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.teal),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
