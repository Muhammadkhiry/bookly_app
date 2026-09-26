import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum SelectedTab { home, search, favorites, profile }

class _HomeViewState extends State<HomeView> {
  var _selectedTab = SelectedTab.home;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: SelectedTab.values.indexOf(_selectedTab),
        height: 10,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.white.withOpacity(0.2),
        onTap: _handleIndexChanged,
        items: [
          /// book
          CrystalNavigationBarItem.svg(
            iconPath: "assets/images/books.svg",
            unselectedIconPath: "assets/images/books.svg",
            selectedColor: Colors.white,
          ),

          /// book mark
          CrystalNavigationBarItem(
            icon: Icons.bookmark,
            unselectedIcon: Icons.bookmark,
            selectedColor: Colors.white,
          ),

          /// library music
          CrystalNavigationBarItem.svg(
            iconPath: "assets/images/audio.svg",
            unselectedIconPath: "assets/images/audio.svg",
            selectedColor: Colors.white,
          ),

          /// user avatar
          CrystalNavigationBarItem.svg(
            iconPath: "assets/images/user_avatar.svg",
            unselectedIconPath: "assets/images/user_avatar.svg",
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
