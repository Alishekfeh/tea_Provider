import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({Key? key, this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
          color: Colors.grey[300],
          onTabChange: (value) => onTabChange!(value) ,
          activeColor: Colors.white,
          gap: 8,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: const [
        GButton(
          icon: Icons.home,
          text: "shop",
        ),
        GButton(
          icon: Icons.shopping_bag,
          text: "cart",
        ),
      ]),
    );
  }
}
