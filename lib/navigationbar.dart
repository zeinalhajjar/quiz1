
import 'package:flutter/material.dart';
import 'Question2/lazzy_laoding.dart';
import 'home2.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _State();
}

class _State extends State<NavigationBars> {
  int _currentIndex = 0;
  final screens = [
     Center(child: MyHomePage()),
    const Center(child: Home2()),
    const Center(child: Home2()),
    const Center(child: Home2()),
    const Center(child: Home2()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          backgroundColor: Colors.white,
          elevation: 3,
          selectedItemColor: Colors.green,
          currentIndex: _currentIndex,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.storefront_outlined,
              ),
              label: 'Shop',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.manage_search_outlined,
              ),
              label: 'Search',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Cart',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: 'Favourite',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'Account',
              backgroundColor: Colors.green,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
