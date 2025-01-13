import 'package:flutter/material.dart';
import '../../core/crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/features/main_screens/home_screen/home_screen.dart';
import 'package:unilearn/features/main_screens/lessons_screen/lessons_screen.dart';
import 'package:unilearn/features/main_screens/profile_screen/profile_screen.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:vibration/vibration.dart';

import '../../settings/settings.dart';


class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LessonScreen(),
    const ProfileScreen(),
  ];

  void _onSelectTab(int index) {
    if (vibration != false) {
      Vibration.vibrate(duration: 200);
    }
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _pages[_currentIndex],
      ),
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(  
        currentIndex: _currentIndex,
        paddingR: const EdgeInsets.symmetric(horizontal: 20),
        marginR: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        splashColor: Colors.transparent,
        indicatorColor: AppColors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 105, 105, 105),
        backgroundColor: Colors.black.withOpacity(0.1),
        outlineBorderColor: Colors.black.withOpacity(0.1),
        onTap: _onSelectTab,
        items: [
          CrystalNavigationBarItem(
            icon: HugeIcons.strokeRoundedHome04,
            iconSize: 30,
            unselectedIcon: HugeIcons.strokeRoundedHome04,
          ),
          CrystalNavigationBarItem(
            icon: HugeIcons.strokeRoundedBook02,
            iconSize: 30,
            unselectedIcon: HugeIcons.strokeRoundedBook02,
          ),
          CrystalNavigationBarItem(
            icon: HugeIcons.strokeRoundedUser,
            iconSize: 30,
            unselectedIcon: HugeIcons.strokeRoundedUser,
          ),
        ],
      ),
    );
  }
}