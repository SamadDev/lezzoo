import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lezzoo_assignment/components/Test.dart';
import 'package:lezzoo_assignment/components/Theme.dart';
import 'package:lezzoo_assignment/screens/home_screen/home_scree.dart';
import 'package:lezzoo_assignment/screens/stores/stores_screen.dart';




class NavigationBarScreen extends StatefulWidget {
  static const String route = '/';

  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 0;
  final List<dynamic> _children = [
    HomeScreen(),
    StoresScreen(),
    Test(),
    Test()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              height: 20,
              color:
                  _currentIndex == 0 ? AppTheme.primaryColor : AppTheme.grey700,
            ),
            label: "سەرەکی",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/menu.svg',
              height: 20,
              color:
                  _currentIndex == 1 ? AppTheme.primaryColor : AppTheme.grey700,
            ),
            label: 'هاوپۆل',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/heart.svg',
              height: 20,
              color:
                  _currentIndex == 2 ? AppTheme.primaryColor : AppTheme.grey700,
            ),
            label: 'دڵخوازەکان',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/user.svg',
              height: 20,
              color:
                  _currentIndex == 3 ? AppTheme.primaryColor : AppTheme.grey700,
            ),
            label: 'هەژمار',
          )
        ],
        currentIndex: _currentIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.grey700,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
