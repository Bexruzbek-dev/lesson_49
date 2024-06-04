import 'package:flutter/material.dart';

class Railnav extends StatefulWidget {
  const Railnav({super.key});

  @override
  State<Railnav> createState() => _RailnavState();
}

class _RailnavState extends State<Railnav> {
   int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
                    backgroundColor: Colors.white,
                    onDestinationSelected: _onItemTapped,
                    labelType: NavigationRailLabelType.selected,
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text("Home"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.search),
                        label: Text("Statistics"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person),
                        label: Text("Profile"),
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                  );
  }
}