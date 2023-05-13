import 'package:dog_breed_classification/views/homepage_view.dart';
import 'package:dog_breed_classification/views/scanner_view.dart';
import 'package:dog_breed_classification/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomepageView(),
      getPages: [
        GetPage(name: '/welcome_view', page: () => WelcomeView()),
        GetPage(name: '/scanner_view', page: () => ScannerView()),
      ],
    );
  }
}
