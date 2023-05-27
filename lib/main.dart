import 'package:dog_breed_classification/views/homepage_view.dart';
import 'package:dog_breed_classification/views/live_feed_view.dart';
import 'package:dog_breed_classification/views/onboarding_view.dart';
import 'package:dog_breed_classification/views/scanner_view.dart';
import 'package:dog_breed_classification/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PupIdentify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showHome ? const HomepageView() : const OnBoardingScreen(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomepageView(),
        '/live_feed': (context) => const LiveFeedView(),
      },
    );
  }
}
