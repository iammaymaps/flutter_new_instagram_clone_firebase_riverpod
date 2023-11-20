import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80.0, // Set the desired height
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_rounded,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_rounded,
                ),
              ),
            ),
          ],
          title: SvgPicture.network(
            "https://www.vectorlogo.zone/logos/instagram/instagram-wordmark.svg",
            color: Colors.white,
            height: 45,
            width: 45,
          )),
      body: Column(children: [Text("I am alright ")]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 23.0, // Set the font size for the selected item
        unselectedFontSize: 23.0, // Set the font size for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_rounded),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            backgroundColor: Colors.black,
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
