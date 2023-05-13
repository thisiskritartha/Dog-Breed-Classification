import 'dart:io';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({Key? key}) : super(key: key);

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  late ImagePicker picker;
  File? _image;
  String dogBreed = 'Dog Breed';
  String dogProb = '80%';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    picker = ImagePicker();
  }

  @override
  void dispose() {
    super.dispose();
  }

  imageFromGallery() async {
    final XFile? pickFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 300.0,
      maxWidth: 300.0,
    );
    if (pickFile != null) {
      setState(() {
        _image = File(pickFile.path);
      });
    }
  }

  imageFromCamera() async {
    final XFile? pickFile = await picker.pickImage(source: ImageSource.camera);
    _image = File(pickFile!.path);
    setState(() {
      _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          height: size.height * 0.4,
          width: size.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0.wp),
                bottomRight: Radius.circular(10.0.wp),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.5,
          height: size.height * 0.5,
          width: size.width,
          child: Column(
            children: [
              Text(
                'Prediction',
                style: TextStyle(
                  fontSize: 10.0.wp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3.wp,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                '$dogProb - $dogBreed',
                style: TextStyle(
                  fontSize: 6.0.wp,
                  color: Colors.green,
                  letterSpacing: 0.4.wp,
                ),
              ),
              SizedBox(
                height: size.height * 0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          imageFromCamera();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          side: BorderSide(
                            color: Colors.green,
                            width: 0.8.wp,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.wp),
                          child: Icon(
                            Icons.camera_alt,
                            size: 10.0.wp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0.wp),
                        child: Text(
                          'Take Photo',
                          style: TextStyle(
                            fontSize: 5.0.wp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.08,
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          imageFromGallery();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          side: BorderSide(
                            color: Colors.green,
                            width: 0.8.wp,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0.wp),
                          child: Icon(
                            Icons.image,
                            size: 10.0.wp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0.wp),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 5.0.wp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
