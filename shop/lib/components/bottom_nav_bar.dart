import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:  GNav(
        color: const Color.fromARGB(255, 107, 3, 234),
        activeColor: Colors.black,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
            textStyle: TextStyle(fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
