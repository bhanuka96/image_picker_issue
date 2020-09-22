import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'cameraLogo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File image;
  final ImagePicker picker = ImagePicker();

  void process(int index) async {
    PickedFile pickedFile;
    if (index == 1) {
      pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    }

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CameraLogo(boxSize: 100, image: image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {
                  process(0);
                },
                child: Text('Camera'),
              ),
              RaisedButton(
                onPressed: () {
                  process(1);
                },
                child: Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
