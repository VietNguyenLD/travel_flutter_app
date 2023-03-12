import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/representation/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = 'main-screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.deepOrangeAccent,
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.house, size: kDefaultIconSize),
              title: Text('Home')),
          SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart, size: kDefaultIconSize),
              title: Text('Likes')),
          SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.briefcase, size: kDefaultIconSize),
              title: Text('Booking')),
          SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.solidUser, size: kDefaultIconSize),
              title: Text('Profile')),
        ],
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: EdgeInsets.symmetric(
            vertical: kDefaultPadding, horizontal: kMediumPadding),
      ),
    );
  }
}
