import 'dart:io';

import 'package:flutter/material.dart';

class CameraLogo extends StatelessWidget {
  final double boxSize;
  final File image;

  const CameraLogo({Key key, @required this.boxSize, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize,
      width: boxSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green, width: 2),
          color: image == null ? Colors.green : null,
          image: image != null ? DecorationImage(fit: BoxFit.cover, image: FileImage(image)) : null),
      child: image != null ? null : Center(child: Icon(Icons.camera)),
    );
  }
}
