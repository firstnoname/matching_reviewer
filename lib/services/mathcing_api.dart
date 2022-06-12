import 'dart:typed_data';

import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/based_api.dart';
import 'package:matching_reviewer/utilities/constants.dart';

import 'services.dart';

class MatchingAPI extends BasedAPI {
  static const collectionName = "matching";
  static MatchingAPI? _cache;

  factory MatchingAPI() {
    _cache ??= MatchingAPI._();
    return _cache!;
  }

  MatchingAPI._() : super(collectionName: collectionName);

  Future<bool> addMatching({required Matching matchingInfo}) async {
    List? imagesObject = matchingInfo.product?.pictures;
    matchingInfo.product?.pictures = [];
    List<String> imagesPathOnFireStore = [];
    var response = await collection.add(matchingInfo.toMap()).catchError((e) {
      print('add matching info failure. code -> $e');
    });

    // upload image by id from firebase.
    if (imagesObject!.isNotEmpty) {
      print('upload image');
      imagesObject.map((image) async {
        String? _uploadedPath = await ImageApi()
            .uploadFile(image,
                '$productPathOnFireStore${matchingInfo.entrepreneur!.id}')
            .catchError((error) {
          print('upload image error in matching_api.dart with msg -> $error');
        });
        if (_uploadedPath.isNotEmpty) {
          imagesPathOnFireStore.add(_uploadedPath);
        }
      });
    }

    // update product info on firebase.
    if (imagesPathOnFireStore.isNotEmpty) {
      await collection
          .doc(response.id)
          .update({'product.pictures': imagesPathOnFireStore});
    }

    print('response -> $response');
    return false;
  }

  Future<List<Matching>> getMatchingList({required String userId}) async {
    var response = await collection
        .where('entrepreneur.id', isEqualTo: userId)
        .get()
        .catchError((error) {});
    List<Matching> _list = [];
    if (response.docs.isNotEmpty) {
      _list = response.docs
          .map((e) => Matching.fromMap(e.data()..addAll({'id': e.id})))
          .toList();
    }
    return _list;
  }
}
