import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/views/screens/home_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(
      id: 1,
    ),
    HomeScreen(
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
        unselectedItemColor: R.colors.lightDisabledInputColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItemMethod(Icons.home, Colors.amber, "Início"),
          BottomNavigationBarItemMethod(
              Icons.home, Colors.blueAccent, "Início"),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BottomNavigationBarItem BottomNavigationBarItemMethod(
    IconData icon,
    Color? color,
    String dataLabel,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: color,
      ),
      label: dataLabel,
    );
  }
}
