import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dog_breed_classification/extension/extension.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(4.5.wp),
          ),
        ),
        shadowColor: Colors.grey,
        backgroundColor: Colors.green,
        title: Text(
          'DOG BREED CLASSIFICATION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 5.0.wp,
          ),
        ),
      ),
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
                icon: Icons.ac_unit,
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
          ),
        ),
      ),
    );
  }
}
