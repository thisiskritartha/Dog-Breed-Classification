import 'dart:io';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:dog_breed_classification/extension/app_color.dart';
import '../widgets/image_view_widget.dart';
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
      model: "assets/ml/model_v3.tflite",
      labels: "assets/ml/labels_v3.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  Column appFeatures({
    required icon,
    required text,
    required onPressed,
    shape,
    width,
    iconPadding,
    textPadding,
    iconSize,
  }) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: shape ?? const StadiumBorder(),
            side: BorderSide(
              color: color,
              width: width ?? 1.0.wp,
            ),
          ),
          child: Padding(
            padding: iconPadding ?? EdgeInsets.all(4.6.wp),
            child: Icon(
              icon,
              size: iconSize ?? 9.4.wp,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: textPadding ?? EdgeInsets.all(2.0.wp),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 5.0.wp,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ],
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
          child: ImageViewWidget(image: _image),
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appFeatures(
                      icon: FontAwesomeIcons.camera,
                      text: 'Take Photo',
                      onPressed: () {
                        imageFromCamera();
                      },
                    ),
                    appFeatures(
                      icon: FontAwesomeIcons.video,
                      text: 'Live Feed',
                      shape: const CircleBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LiveFeedView(),
                          ),
                        );
                      },
                      width: 1.5.wp,
                      iconPadding: EdgeInsets.all(7.0.wp),
                      textPadding: EdgeInsets.all(4.0.wp),
                      iconSize: 12.0.wp,
                    ),
                    appFeatures(
                      icon: Icons.image,
                      text: 'Gallery',
                      onPressed: () {
                        imageFromGallery();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
