import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/orders_page.dart';
import 'package:flutter_application_1/pages/categories_page.dart';
import 'package:flutter_application_1/pages/anasayfa.dart';
import 'package:flutter_application_1/widgets/drawer_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    if (mounted) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  Widget _showPage(int index) {
    switch (index) {
      case 0:
        return Anasayfa();
      case 1:
        return CategoriesPage();
      case 2:
        return OrdersPage();
      case 3:
        return ProfilePage();
      default:
        return Anasayfa(); // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showPage(selectedIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.blue,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color.fromARGB(255, 231, 178, 196),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
