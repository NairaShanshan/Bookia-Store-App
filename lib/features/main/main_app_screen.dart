import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cart/presentation/pages/cart_screen.dart';
import '../home/presentation/pages/home_screen.dart';
import '../profile/presentation/pages/profile_screen.dart';
import '../wishlist/presentation/pages/wishlist_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key, this.initialIndex});
  final int? initialIndex ;
  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0 ;
  List<Widget> screens = [
    HomeScreen() ,
    WishListScreen() ,
    CartScreen() ,
    ProfileScreen()
  ] ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (index) {
          setState(() {
            currentIndex = index ;
          });
          },

          items: [
            navBarItem(label: 'home', image: AppImages.homeSvg) ,
            navBarItem(label: 'bookMark', image: AppImages.bookMarkSvg) ,
            navBarItem(label: 'category', image: AppImages.categorySvg) ,
            navBarItem(label: 'profile', image: AppImages.profileSvg) ,


      ]),
    );
  }

  BottomNavigationBarItem navBarItem ({
    required String label ,
    required String image ,

}) {
    return BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          image,
          colorFilter:const  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
        ),
        icon: SvgPicture.asset(image) , label: label ) ;
  }
}
