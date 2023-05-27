import 'package:dog_breed_classification/views/about_this_app_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dog_breed_classification/extension/extension.dart';
import 'available_breeds_view.dart';
import 'live_feed_view.dart';
import 'scanner_view.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dog_breed_classification/extension/app_color.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  int currentIndex = 0;

  GButton navButton(BuildContext context,
      {required icon, required text, onPressed}) {
    return GButton(
      icon: icon,
      text: text,
      iconActiveColor: Colors.white,
      iconColor: Colors.white,
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2.wp,
        fontSize: 4.6.wp,
      ),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const ScannerView(),
      const AvailableBreedsView(),
      const AboutThisApp(),
    ];

    return Scaffold(
      body: SafeArea(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0.wp),
            topRight: Radius.circular(6.0.wp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 1.0.wp,
            vertical: 1.5.wp,
          ),
          child: GNav(
            haptic: true, // haptic feedback
            gap: 3.0.wp,
            iconSize: 7.5.wp,
            backgroundColor: Colors.transparent,
            activeColor: Colors.grey,
            tabBackgroundColor: Colors.black12,
            padding: EdgeInsets.all(3.0.wp),
            tabs: [
              navButton(
                context,
                icon: FontAwesomeIcons.camera,
                text: 'Scanner',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomepageView(),
                    ),
                  );
                },
              ),
              navButton(
                context,
                icon: FontAwesomeIcons.search,
                text: 'Available Breeds',
              ),
              navButton(
                context,
                icon: FontAwesomeIcons.dog,
                text: 'About this App',
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
