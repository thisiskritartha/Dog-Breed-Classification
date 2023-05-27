import 'dart:io';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageViewWidget extends StatelessWidget {
  const ImageViewWidget({
    super.key,
    required File? image,
  }) : _image = image;

  final File? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
