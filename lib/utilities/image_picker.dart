import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ImagePicker {
  Future<Uint8List?> getImageBytes() async {
    Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    return fromPicker;
  }

  Future<List<Uint8List>> getMultiImagesBytes(BuildContext context,
      {int maxImages = 1}) async {
    List<Uint8List> fromPicker =
        (await ImagePickerWeb.getMultiImages(outputType: ImageType.bytes) ?? [])
            as List<Uint8List>;

    if (fromPicker.isNotEmpty) {
      if (fromPicker.length > maxImages) {
        fromPicker = [];
        // UIFeedback(context).showErrorDialog(context,
        //     title: 'เกิดข้อผิดพลาด',
        //     content: 'ท่านเลือกรูปจำนวนมากเกินไป, เลือกรูปภาพไม่เกิน 10 รูป');
      }
    }

    return fromPicker.map((e) => e).toList();
  }
}
