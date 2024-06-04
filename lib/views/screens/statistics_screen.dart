import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_49/controllers/note_controller.dart';
import 'package:lesson_49/controllers/todo_controller.dart';
import 'package:lesson_49/views/screens/home_screen.dart';
import 'package:lesson_49/views/screens/profile_screen.dart';


class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final todoController = TodoController();
  final notesController = NoteController();
   int? _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(
      () {
        if (index == 0) {
          _selectedIndex = 0;
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          },),);
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
        title: Text("Statistics"),
      ),
      body: Column(
        children: [
          Text(
            "Sizda hozirda ${notesController.notes.length} ta eslatmalar mavjud",
            style: TextStyle(
              fontSize: 24,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          MediaQuery.of(context).size.width < 800 ? BottomNavigationBar(
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
    ): Gap(10),
    );
  }
}
