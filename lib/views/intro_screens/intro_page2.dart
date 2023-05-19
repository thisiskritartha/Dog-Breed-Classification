import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(height: 10.0.wp),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 100.0.wp,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 22.0.wp),
              Text(
                title,
                style: TextStyle(
                  fontSize: 7.55.wp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.0.wp),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 5.0.wp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
