import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_49/views/screens/home_screen.dart';
import 'package:lesson_49/views/screens/statistics_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int? _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(
      () {
        if (index == 0) {
          _selectedIndex = 0;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return HomeScreen();
              },
            ),
          );
        } else if (index == 1) {
          _selectedIndex = 1;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                _selectedIndex = 1;
                return StatisticsScreen();
              },
            ),
          );
        } else if (index == 2) {
          _selectedIndex = 2;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return UserProfile();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User profile picture (replace with your image asset path)
            const CircleAvatar(
              backgroundImage: AssetImage('assets/user_picture.png'),
              radius: 50.0,
            ),
            const Gap(20),
            // User name
            Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text('John Doe'),
              ],
            ),
            const Gap(10),
            // User surname
            Row(
              children: [
                const Text(
                  'Surname:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text('Smith'),
              ],
            ),
            const Gap(10),
            // User phone number
            Row(
              children: [
                const Text(
                  'Phone:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text('+123 456 7890'),
              ],
            ),
            const Spacer(),
            // Edit profile button (disabled for now)
            ElevatedButton(
              onPressed: null, // Functionality not implemented
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex!,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
