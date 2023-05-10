import 'package:dog_breed_classification/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/welcome_view', page: () => WelcomeView()),
      ],
    );
  }
}
