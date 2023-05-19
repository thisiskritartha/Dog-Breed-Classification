import 'package:dog_breed_classification/extension/app_color.dart';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({Key, key}) : super(key: key);

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  String _permissionStatus = '';
  Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.camera.request();
    setState(() {
      if (status.isGranted) {
        _permissionStatus = 'Permission Granted';
        Get.snackbar(
          _permissionStatus,
          'Thank you for your permission.',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: color,
          colorText: Colors.white,
          // padding: EdgeInsets.symmetric(
          //   horizontal: 15.0.wp,
          //   vertical: 3.0.wp,
          // ),
        );
      } else if (status.isDenied) {
        _permissionStatus = 'Permission Denied';
        Get.snackbar(
          _permissionStatus,
          'This app requires the Camera and Gallery permission in order to classify the breed.',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: color,
          colorText: Colors.black,
        );
      } else if (status.isPermanentlyDenied) {
        _permissionStatus = 'Permission Permanently Denied!';
        Get.snackbar(
          _permissionStatus,
          'This app requires the Camera and Gallery permission in order to classify the breed.',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: color,
          colorText: Colors.black,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(height: 20.0.wp),
              Image.asset(
                "assets/images/page2.jpg",
                height: 90.0.wp,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0.wp),
              Text(
                'We need Access',
                style: TextStyle(
                  fontSize: 7.55.wp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.0.wp),
              Text(
                'To identify dog breeds, we need access to the camera and gallery of your device.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 5.0.wp,
                ),
              ),
              SizedBox(height: 1.0.wp),
              ElevatedButton(
                onPressed: () {
                  _requestPermission();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(color),
                ),
                child: const Text('Get Permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
