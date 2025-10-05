import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0 ;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
        BottomNavigationBarItem(
          // activeIcon: ,
          icon: SvgPicture.asset('assets/icons/Home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Bookmark.svg'),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Category.svg'),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Profile.svg'),
          label: 'Profile',
        ),

      ]),
    );
  }
}
