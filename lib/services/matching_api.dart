import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';

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
    List<String> imagesPathOnFireStore = [];

    // remove image type UInt8List;
    List<Uint8List>? imagesObject =
        matchingInfo.product?.pictures as List<Uint8List>;
    matchingInfo.product?.pictures = [];
    Uint8List imageSlipTransfer = matchingInfo.payment?.payImage;
    matchingInfo.payment?.payImage = null;

    // upload matching info to firebase and get id.
    await collection.add(matchingInfo.toMap()).catchError((e) {
      debugPrint('add matching info failure. code -> $e');
    }).then((value) => matchingInfo.id = value.id);

    // upload image by id from firebase.
    if (imagesObject.isNotEmpty) {
      debugPrint('upload image');
      for (var image in imagesObject) {
        String? _uploadedPath = await ImageApi()
            .uploadImage(image,
                '$productPathOnFireStore/${matchingInfo.id}/${imagesObject.indexOf(image)}')
            .catchError((error) {
          debugPrint(
              'upload image error in matching_api.dart with msg -> $error');
        });
        if (_uploadedPath.isNotEmpty) {
          imagesPathOnFireStore.add(_uploadedPath);
          matchingInfo.product?.pictures?.addAll(imagesPathOnFireStore);
        }
      }
    }

    // upload transfer slip.
    String? _uploadedSlip = await ImageApi().uploadImage(imageSlipTransfer,
        '$productPathOnFireStore/${matchingInfo.id}/$paymentSlipOnFireStore/payment');
    if (_uploadedSlip.isNotEmpty) {
      matchingInfo.payment?.payImage = _uploadedSlip;
    }

    // update product info on firebase.
    if (imagesPathOnFireStore.isNotEmpty) {
      await collection
          .doc(matchingInfo.id)
          .update({'product.pictures': imagesPathOnFireStore});
    }
    return matchingInfo;
  }

  Future<bool> updateMatchingStatus({required Matching matchingInfo}) async {
    bool isUpdateSuccess = true;

    await collection
        .doc(matchingInfo.id)
        .update(matchingInfo.toMap())
        .catchError((error) {
      isUpdateSuccess = false;
    });

    return isUpdateSuccess;
  }

  Future<bool> updateMatchingInfo({required Matching matchingInfo}) async {
    bool isUpdateSuccess = true;
    await collection.doc(matchingInfo.id).update(
        {'reviewer': matchingInfo.reviewer?.toMap()}).catchError((error) {
      isUpdateSuccess = false;
    });

    return isUpdateSuccess;
  }

  Future<bool> updateMatchingReviewedForm(
      {required Matching matchingInfo}) async {
    bool isUpdateSuccess = true;
    await collection.doc(matchingInfo.id).update({
      'product.reviewedFormPath': matchingInfo.product?.reviewedFormPath
    }).catchError((error) {
      isUpdateSuccess = false;
    });
    return isUpdateSuccess;
  }

  Future<List<Matching>> getMatchingList({bool isReviewerNull = true}) async {
    QuerySnapshot<Map<String, dynamic>>? response;
    if (isReviewerNull) {
      response =
          await collection.where('reviewer', isNull: isReviewerNull).get();
    } else if (isReviewerNull == false) {
      response = await collection.get();
    }

    return response!.docs
        .map((e) => Matching.fromMap(e.data()..addAll({'id': e.id})))
        .toList();
  }

  Future<List<Matching>> getMatchingListByUserId(
      {required String userId}) async {
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

  Future<List<Matching>> getMatchingListByReviewerId(
      {required String userId}) async {
    var response = await collection
        .where('reviewer.id', isEqualTo: userId)
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
        .where('reviewer', isNull: true)
        .where('productExpertiseSubCategory', isEqualTo: subCategory)
        .get();

    _products = response.docs
        .map((prod) => Matching.fromMap(prod.data()..addAll({'id': prod.id})))
        .toList();

    return _products;
  }
}
