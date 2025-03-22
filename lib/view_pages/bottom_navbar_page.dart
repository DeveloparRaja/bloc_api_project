import 'package:bloc_flutter/view_pages/api_view_page.dart';
import 'package:bloc_flutter/view_pages/favorite_view_page.dart';
import 'package:bloc_flutter/view_pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ApiViewPage(),
    FavoriteViewPage(),
    Center(child: Text("👤 Profile", style: TextStyle(fontSize: 22))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
       type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]
      ),
    );
  }
}
