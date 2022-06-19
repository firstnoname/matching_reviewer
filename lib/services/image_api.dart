import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'package:firebase_storage/firebase_storage.dart';

class ImageApi {
  Future<String> uploadFile(Uint8List file, String fireStorePath) async {
    String url = '';
    try {
      //reduce image size.
      Uint8List resizedData = file;
      img.Image _img = img.decodeImage(file)!;
      debugPrint('original size -> w: ${_img.width},h: ${_img.height}');
      debugPrint(
          'reduced size -> w: ${_img.width * 0.1},h: ${_img.height * 0.1}');
      img.Image resized = img.copyResize(_img,
          width: (_img.width * 0.1).toInt(),
          height: (_img.height * 0.1).toInt());
      resizedData = Uint8List.fromList(img.encodeJpg(resized, quality: 30));
      debugPrint('resized data -> ${resizedData.length}');
      TaskSnapshot upload = await FirebaseStorage.instance
          .ref(fireStorePath)
          .putData(resizedData)
          .catchError((error) {
        debugPrint('upload image error -> $error');
      });
      url = await upload.ref.getDownloadURL().catchError((error) {
        debugPrint('get url error -> $error');
      });
    } on Exception catch (e) {
      debugPrint('Upload file failed -> ${e.toString()}');
    }
    return url;
  }
}
