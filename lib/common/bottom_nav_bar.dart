import 'package:flutter/material.dart';

class CusBottomNavBar extends StatefulWidget {
  const CusBottomNavBar({super.key});

  @override
  State<CusBottomNavBar> createState() => _CusBottomNavBarState();
}

class _CusBottomNavBarState extends State<CusBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            size: 20,
            color: Colors.brown,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
            size: 20,
            color: Colors.brown,
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.brown,
            size: 20,
          ),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            size: 20,
            color: Colors.brown,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
