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

  Future<Matching> addMatching({required Matching matchingInfo}) async {
    bool _isSuccess = false;
    List<Uint8List>? imagesObject =
        matchingInfo.product?.pictures as List<Uint8List>;
    matchingInfo.product?.pictures = [];
    List<String> imagesPathOnFireStore = [];
    var response = await collection.add(matchingInfo.toMap()).catchError((e) {
      print('add matching info failure. code -> $e');
    }).then((value) => matchingInfo.id = value.id);

    // upload image by id from firebase.
    if (imagesObject.isNotEmpty) {
      print('upload image');
      for (var image in imagesObject) {
        String? _uploadedPath = await ImageApi()
            .uploadFile(image,
                '$productPathOnFireStore${matchingInfo.entrepreneur!.id}_${imagesObject.indexOf(image)}')
            .catchError((error) {
          print('upload image error in matching_api.dart with msg -> $error');
        });
        if (_uploadedPath.isNotEmpty) {
          imagesPathOnFireStore.add(_uploadedPath);
        }
      }
    }

    // update product info on firebase.
    if (imagesPathOnFireStore.isNotEmpty) {
      await collection
          .doc(matchingInfo.id)
          .update({'product.pictures': imagesPathOnFireStore});
      _isSuccess = true;
    }

    return matchingInfo;
  }

  Future<bool> updateMatchingInfo({required Matching matchingInfo}) async {
    bool isUpdateSuccess = await collection
        .doc(matchingInfo.id)
        .update({'reviewer': matchingInfo.reviewer?.toMap()})
        .then((value) => true)
        .catchError((error) => false);
    return isUpdateSuccess;
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

  Future<List<Matching>> getMatchingByCategory(
      {required String subCategory}) async {
    List<Matching> _products = [];
    var response = await collection
        .where('productExpertiseSubCategory', isEqualTo: subCategory)
        .get();

    _products = response.docs
        .map((prod) => Matching.fromMap(prod.data()..addAll({'id': prod.id})))
        .toList();

    return _products;
  }
}
