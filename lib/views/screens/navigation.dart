import 'package:flutter/material.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/views/screens/assets/assets_screen.dart';
import 'package:vibraguard/views/screens/profile_screen.dart';

import 'orders/orders_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const AssetsScreen(
      id: 1,
    ),
    const OrdersScreen(),
    const ProfileScreen(),
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
          BottomNavigationBarItemMethod(Icons.person, "Profile"),
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
