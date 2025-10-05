import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            'assets/images/logo2.svg',
            width: 99,
            height: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.asset(
              'assets/icons/search-normal.svg',
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Best Seller',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 281,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5EFE1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text('Item $index')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Home.svg'),
          label: 'Home', // من flutter_svg_provider
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
