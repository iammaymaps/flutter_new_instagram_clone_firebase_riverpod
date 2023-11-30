import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/HomePageScreen.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/ReelsWatch.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/SearchScreen.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/addPostScreen.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/profileScreen.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/Post/PostWiget.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/domain/authController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logoutuser() {
    ref.read(authControllerProvider.notifier).logOutUser();
  }

  List<Widget> pages = [
    AddPostScreen(),
    HomePageScreen(),
    SearchScreen(),
    ReelsWatch(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
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
            icon: Icon(Icons.account_circle_outlined),
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
