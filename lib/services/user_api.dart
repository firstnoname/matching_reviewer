import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'services.dart';

class UserAPI extends BasedAPI {
  static const collectionName = "users";
  static UserAPI? _cache;

  factory UserAPI() {
    _cache ??= UserAPI._();
    return _cache!;
  }

  UserAPI._() : super(collectionName: collectionName);

  Future<bool> isUserIdExist({required String uId}) async {
    return await collection.doc(uId).get().then((value) {
      if (value.exists) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<User?> getUserInfo(String? id) async {
    var snapshot = await collection.doc(id).get().catchError((e) {
      debugPrint('Get user error. msg -> ${e.toString()}');
    });
    return (!snapshot.exists)
        ? null
        : User.fromMap(
            snapshot.data()!..addAll({'uid': id}),
          );
  }

  Future<List<User>> getUsers({
    String? userRole = '',
    String? category = '',
    String? subCategory = '',
  }) async {
    List<User> userList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> response = await collection
          .where('userRole', isEqualTo: userRole)
          .where('productExpertise.$category.$subCategory', isEqualTo: true)
          .get();

      debugPrint('user response -> $response');

      userList = response.docs.map((e) => User.fromMap(e.data())).toList();

      debugPrint('user size -> ${userList.length}');
    } catch (e) {
      debugPrint('exception -> $e');
    }

    return userList;
  }

  Future<bool> addUser({required User userInfo}) async {
    bool _isSuccess = true;
    try {
      debugPrint('user id -> ${userInfo.id}');
      await collection
          .doc(userInfo.id)
          .set(userInfo.toMap())
          .catchError((e) => debugPrint('Add member failed -> $e'));
    } on FirebaseException catch (e) {
      _isSuccess = false;
      debugPrint('add member failed -> ${e.message}');
    }
    return _isSuccess;
  }

  Future<User> updateUserInfo(User userInfo) async {
    await collection.doc(userInfo.id).update(userInfo.toMap());
    return userInfo;
  }

  Future<bool> changeUserStatus(
      {required String userId, required bool isAdmin}) async {
    bool isSuccess = false;

    String userStatus = isAdmin == true ? 'admin' : 'user';

    // try {
    //   await FirebaseFirestore.instance
    //       .collection(collectionName)
    //       .doc(userId)
    //       .update({'member_status': userStatus}).then(
    //           (value) => isSuccess = true);
    // } catch (e) {
    //   print('Change status failed');
    // }

    return isSuccess;
  }
}
