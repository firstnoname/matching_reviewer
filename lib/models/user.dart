import 'dart:convert';

import 'package:matching_reviewer/models/models.dart';

enum UserRoles { admin, reviewer, entrepreneur }

class User {
  static const String collection = 'users';

  String? id;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? identityCard;
  String? phoneNumber;
  String? email;
  String? userName;
  String? token;
  String? imageProfilePath;
  String? userRole;
  String? sex;
  String? occupation;
  String? orgSize;
  String? orgType;
  ProductExpertise? productExpertise;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.identityCard,
    this.phoneNumber,
    this.email,
    this.userName,
    this.token,
    this.imageProfilePath,
    this.userRole,
    this.sex,
    this.occupation,
    this.orgSize,
    this.orgType,
    this.productExpertise,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'identityCard': identityCard,
      'phoneNumber': phoneNumber,
      'email': email,
      'userName': userName,
      'token': token,
      'imageProfilePath': imageProfilePath,
      'userRole': userRole,
      'sex': sex,
      'occupation': occupation,
      'organizationSize': orgSize,
      'organizationType': orgType,
      'productExpertise': productExpertise?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'])
          : null,
      identityCard: map['identityCard'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      userName: map['userName'],
      token: map['token'],
      imageProfilePath: map['imageProfilePath'],
      userRole: map['userRole'],
      sex: map['sex'],
      occupation: map['occupation'],
      orgSize: map['organizationSize'],
      orgType: map['organizationType'],
      productExpertise: map['productExpertise'] != null
          ? ProductExpertise.fromMap(map['productExpertise'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
