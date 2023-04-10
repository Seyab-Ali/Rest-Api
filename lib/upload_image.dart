import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final _picker = ImagePicker();
  bool showPicker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: image == null ? const Center(child: Text('Pick Image'),)
                  :
              Container(
                child: Center(
                  child: Image.file(
                    File(image!.relativePath, ),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
          )


        ],
      ),
    );
  }
}
