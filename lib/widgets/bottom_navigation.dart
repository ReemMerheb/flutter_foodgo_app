import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart'; 
import 'package:flutter_foodgo/pages/chat_page.dart';
import 'package:flutter_foodgo/pages/favorites_page.dart';
import 'package:flutter_foodgo/pages/first.dart';
import 'package:flutter_foodgo/pages/profile_page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    
    final iconList = <IconData>[
      Icons.home,
      Icons.person,
      Icons.chat,
      Icons.favorite,
    ];

    return AnimatedBottomNavigationBar(
      icons: iconList,  
      activeIndex: 0,   
      backgroundColor: Color.fromARGB(255, 255, 0, 0), 
      activeColor: const Color.fromARGB(255, 255, 251, 250),
      inactiveColor: const Color.fromARGB(255, 243, 238, 238),
      gapLocation: GapLocation.none,  
      notchSmoothness: NotchSmoothness.defaultEdge,  
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstPage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
            break;
        }
      },
    );
  }
}
