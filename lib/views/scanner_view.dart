import 'dart:io';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:dog_breed_classification/extension/app_color.dart';
import 'live_feed_view.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({Key? key}) : super(key: key);

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  late ImagePicker picker;
  File? _image;
  String dogBreed = '';
  String dogProb = '';
  late List output;

  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() async {
    await Tflite.close();
    super.dispose();
  }

  imageFromGallery() async {
    final XFile? pickFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickFile == null) return;
    setState(() {
      _image = File(pickFile.path);
    });
    detectImage(_image!);
  }

  detectImage(File image) async {
    List? recognitions;
    try {
      recognitions = await Tflite.runModelOnImage(
        path: image!.path,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.5, // defaults to 0.1
        asynch: true, // defaults to true
      );
    } catch (e) {
      print('Exception occurred 💥💥💥: $e');
    }
    print('Print: $recognitions');
    setState(() {
      output = recognitions!;
      dogBreed = output[0]['label'];
      dogProb = (output[0]['confidence'] * 100).toStringAsFixed(2);
    });
  }

  imageFromCamera() async {
    final XFile? pickFile = await picker.pickImage(source: ImageSource.camera);
    _image = File(pickFile!.path);

    setState(() {
      _image;
      detectImage(_image!);
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/ml/model_v2.tflite",
      labels: "assets/ml/labels_v2.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          height: size.height * 0.44,
          width: size.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0.wp),
                bottomRight: Radius.circular(10.0.wp),
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.grey,
                  offset: Offset(10, 10),
                )
              ],
              image: _image == null
                  ? const DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: FileImage(File(_image!.path)),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.5,
          height: size.height * 0.55,
          width: size.width,
          child: Column(
            children: [
              Text(
                'Breed Prediction',
                style: TextStyle(
                  fontSize: 10.5.wp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3.wp,
                  color: color,
                ),
              ),
              SizedBox(
                height: size.height * 0.003,
              ),
              Text(
                _image == null
                    ? 'Confidence Level - Dog Breed'
                    : '$dogProb% - $dogBreed',
                style: TextStyle(
                  fontSize: 6.4.wp,
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
                          shape: const StadiumBorder(),
                          side: BorderSide(
                            color: color,
                            width: 1.0.wp,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.6.wp),
                          child: Icon(
                            FontAwesomeIcons.camera,
                            size: 9.4.wp,
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
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LiveFeedView(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          side: BorderSide(
                            color: color,
                            width: 1.5.wp,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7.0.wp),
                          child: Icon(
                            FontAwesomeIcons.video,
                            size: 12.0.wp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0.wp),
                        child: Text(
                          'Live Feed',
                          style: TextStyle(
                            fontSize: 5.0.wp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          imageFromGallery();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: BorderSide(
                            color: color,
                            width: 1.0.wp,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.6.wp),
                          child: Icon(
                            Icons.image,
                            size: 10.4.wp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.6.wp),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 5.0.wp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.4),
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
