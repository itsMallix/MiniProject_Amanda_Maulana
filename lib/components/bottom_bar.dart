import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/viewModels/viewModels_users.dart';
import 'package:miniproject/views/screen_home/screen_home.dart';
import 'package:miniproject/views/screen_maps/screen_maps.dart';
import 'package:miniproject/views/screen_meals/screen_meals.dart';
import 'package:miniproject/views/screen_progress/screen_progress_main.dart';
import 'package:miniproject/views/screen_settings/screen_settings.dart';
import 'package:miniproject/views/screen_signIn/screen_signin.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProgresScreen(),
    const MealScreen(),
    const MapScreen(),
    const SettingScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserManager>(context).userModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello ${userModel?.username ?? ''}",
          style: DesignSystem.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const SizedBox(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          backgroundColor: DesignSystem.mainBlue,
                          child: Icon(
                            Icons.person,
                            color: DesignSystem.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Sign In As :",
                        style: DesignSystem.headlineMedium,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: DesignSystem.secondRed,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${userModel?.username}",
                            style: DesignSystem.headlineSmall,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${userModel?.email}",
                        style: DesignSystem.bodyMedium,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: DesignSystem.mainGreen,
        unselectedItemColor: DesignSystem.maingrey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _currentIndex == 0
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_rounded,
                color: _currentIndex == 1
                    ? DesignSystem.mainGreen
                    : DesignSystem.maingrey),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_dining_rounded,
              color: _currentIndex == 2
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_rounded,
              color: _currentIndex == 3
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _currentIndex == 4
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
