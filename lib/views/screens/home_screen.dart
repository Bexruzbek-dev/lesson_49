import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:lesson_49/views/screens/notes_screen.dart';
import 'package:lesson_49/views/screens/profile_screen.dart';
import 'package:lesson_49/views/screens/statistics_screen.dart';
import 'package:lesson_49/views/screens/todos_screen.dart';

import 'package:lesson_49/views/widgets/railnav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int? _selectedIndex = 0;

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
      backgroundColor: Colors.yellow.shade300,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          "Tasks and Notes Manager",
        ),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (MediaQuery.of(context).size.width > 800) const Railnav(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return NotesScreen();
                            }));
                          },
                          child: Card(
                            color: Colors.yellow.shade100,
                            child: const Center(
                              child: Text(
                                "Notes",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return TodosScreen();
                            }));
                          },
                          child: Card(
                            color: Colors.teal.shade200,
                            child: const Center(
                              child: Text(
                                "To Do tasks",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    ) : Gap(10),
    );
  }
}
