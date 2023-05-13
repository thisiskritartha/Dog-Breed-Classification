import 'package:dog_breed_classification/views/about_this_app_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dog_breed_classification/extension/extension.dart';
import 'available_breeds_view.dart';
import 'scanner_view.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Widget> pages = [
      ScannerView(),
      AvailableBreedsView(),
      AboutThisApp(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      // appBar: AppBar(
      //   centerTitle: true,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(4.5.wp),
      //     ),
      //   ),
      //   shadowColor: Colors.grey,
      //   backgroundColor: Colors.green,
      //   title: Text(
      //     'DOG BREED CLASSIFICATION',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 5.0.wp,
      //       letterSpacing: 0.3.wp,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0.wp),
            topRight: Radius.circular(6.0.wp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 1.5.wp,
            vertical: 1.3.wp,
          ),
          child: GNav(
            haptic: true, // haptic feedback
            gap: 3.5.wp,
            iconSize: 7.5.wp,
            backgroundColor: Colors.transparent,
            activeColor: Colors.black87,
            tabBackgroundColor: Colors.black12,
            padding: EdgeInsets.all(4.0.wp),
            tabs: [
              GButton(
                icon: Icons.camera_alt,
                text: 'Scanner',
                iconActiveColor: Colors.white,
                iconColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3.wp,
                  fontSize: 4.5.wp,
                ),
                onPressed: () {},
              ),
              GButton(
                icon: Icons.search,
                text: 'Available Breeds',
                iconActiveColor: Colors.white,
                iconColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3.wp,
                  fontSize: 4.5.wp,
                ),
                onPressed: () {},
              ),
              GButton(
                icon: FontAwesomeIcons.paw,
                text: 'About this App',
                iconActiveColor: Colors.white,
                iconColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3.wp,
                  fontSize: 4.5.wp,
                ),
                onPressed: () {},
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
