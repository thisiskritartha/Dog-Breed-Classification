import 'package:camera/camera.dart';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';

class LiveFeedWidget extends StatelessWidget {
  const LiveFeedWidget({
    super.key,
    required CameraController? cameraController,
  }) : _cameraController = cameraController;

  final CameraController? _cameraController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.81,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
            offset: Offset(20, 20),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(6.0.wp),
            bottomLeft: Radius.circular(6.0.wp)),
        child: CameraPreview(_cameraController!),
      ),
    );
  }
}
