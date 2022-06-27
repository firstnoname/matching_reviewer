import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileApi {
  Future<String?> uploadFile(Uint8List file, String fireStoragePath) async {
    TaskSnapshot upload = await FirebaseStorage.instance
        .ref(fireStoragePath)
        .putData(file)
        .catchError((error) =>
            debugPrint('upload file failure -> ${error.toString()}'));
    String url = await upload.ref.getDownloadURL().catchError((error) {
      debugPrint('upload file error -> $error');
    });

    return url;
  }
}
