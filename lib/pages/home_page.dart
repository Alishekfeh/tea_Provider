import 'package:flutter/material.dart';
import 'package:tea/pages/shope_page.dart';

import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  bottomBar(int newIndex) {
    setState(() {
      _selectIndex = newIndex;
    });
  }
  final List<Widget>_pages=const [
    ShopPage(),
    CartPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar:  BottomNavBar(
        onTabChange: (index) =>bottomBar(index) ,
      ),
      body: _pages[_selectIndex],
    );
  }
}
