import 'package:flutter/material.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/views/main_views/home/home_tab_screen.dart';
import 'package:kuseng/views/main_views/home/profile_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeTabScreen(),
    const ProfileTabScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4F2FC1),
              Color(0xFF8A1DB4),
            ],
          ),
        ),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: kTextFieldColor,
            ),
            label: 'Home',
            activeIcon: CircleAvatar(child: Icon(Icons.home_rounded)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: kTextFieldColor,
            ),
            label: 'Profile',
            activeIcon: CircleAvatar(
                child: Icon(
              Icons.person,
            )),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: kPrimaryColor,
        // unselectedItemColor: kLightBackColor,
        // selectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 40,
        onTap: _onItemTapped,
      ),
    );
  }
}
