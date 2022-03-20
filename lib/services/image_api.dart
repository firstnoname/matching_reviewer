import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class ImageApi {
  Future<String> uploadFile(Uint8List file, String fireStorePath) async {
    String url = '';
    try {
      TaskSnapshot upload =
          await FirebaseStorage.instance.ref(fireStorePath).putData(file);
      url = await upload.ref.getDownloadURL();
    } on Exception catch (e) {
      print('Upload file failed -> ${e.toString()}');
    }
    return url;
  }
}