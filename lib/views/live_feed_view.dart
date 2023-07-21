import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../extension/app_color.dart';
import '../widgets/live_feed_widget.dart';

class LiveFeedView extends StatefulWidget {
  const LiveFeedView({Key? key}) : super(key: key);

  @override
  State<LiveFeedView> createState() => _LiveFeedViewState();
}

class _LiveFeedViewState extends State<LiveFeedView> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];

  bool isWorking = false;
  String result = '';
  CameraImage? cameraImage;
  String dogBreed = '';
  String dogProb = '';
  List<dynamic> output = [];
  late CameraDescription description = _cameras[0];
  late CameraLensDirection camDirection = CameraLensDirection.back;

  @override
  void initState() {
    super.initState();
    setupCamera();
    loadModel();
  }

  @override
  void dispose() async {
    _cameraController!.dispose();
    await Tflite.close();
    super.dispose();
  }

  toggleCameraDirection() async {
    if (camDirection == CameraLensDirection.back) {
      description = _cameras[1];
      camDirection = CameraLensDirection.front;
    } else {
      description = _cameras[0];
      camDirection = CameraLensDirection.back;
    }
    await _cameraController?.stopImageStream();
    setState(() {
      _cameraController;
    });
    setupCamera();
  }

  Future<void> setupCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(description, ResolutionPreset.high);

    await _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
    });

    setState(() {
      _cameraController!.startImageStream((image) => {
            if (!isWorking)
              {
                isWorking = true,
                cameraImage = image,
                runModelOnStreamFrames(),
              }
          });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/ml/model_v3.tflite",
      labels: "assets/ml/labels_v3.txt",
    );
  }

  runModelOnStreamFrames() async {
    var recognitions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 127.5
        rotation: 90, // defaults to 90, Android only
        numResults: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );

    result = '';
    recognitions?.forEach((element) {
      dogBreed = element['label'];
      dogProb = (element['confidence'] * 100).toStringAsFixed(2);
      setState(() {
        result = '$dogProb% - $dogBreed';
      });
      isWorking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.home,
            size: 6.0.wp,
          ),
          onPressed: () async {
            _cameraController!.dispose();
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.cameraRotate,
              size: 7.5.wp,
            ),
            onPressed: () {
              toggleCameraDirection();
            },
          ),
          SizedBox(
            width: 1.8.wp,
          ),
        ],
        centerTitle: true,
        title: Text(
          'Live Feed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3.wp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LiveFeedWidget(cameraController: _cameraController),
            SizedBox(
              height: 7.4.wp,
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 6.5.wp,
                color: Colors.green,
                letterSpacing: 0.4.wp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
