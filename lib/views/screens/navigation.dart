import 'package:flutter/material.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/views/screens/assets/assets_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AssetsScreen(
      id: 1,
    ),
    AssetsScreen(
      id: 1,
    ),
    AssetsScreen(
      id: 1,
    ),
    AssetsScreen(
      id: 1,
    ),
    AssetsScreen(
      id: 1,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.lightPrimaryBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: R.colors.lightPrimaryBackgroundColor,
        selectedItemColor: R.colors.lightPrimaryColor,
        unselectedItemColor: R.colors.lightIconColor,
        selectedFontSize: 12.0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItemMethod(Icons.home, "Home"),
          BottomNavigationBarItemMethod(Icons.access_time, "Orders"),
          BottomNavigationBarItemMethod(Icons.bar_chart, "History"),
          BottomNavigationBarItemMethod(Icons.person, "Profile"),
          BottomNavigationBarItemMethod(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BottomNavigationBarItem BottomNavigationBarItemMethod(
    IconData icon,
    String dataLabel,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      label: dataLabel,
    );
  }
}
