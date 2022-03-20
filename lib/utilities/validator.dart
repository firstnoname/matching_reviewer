import 'package:flutter/material.dart';

class Validator {
  static Validator? _cache;

  factory Validator(BuildContext context) {
    return _cache ?? Validator._(context);
  }

  Validator._(BuildContext context);

  String? isNotEmpty({String? value}) =>
      (value == null || value.isEmpty) ? 'Please enter some text' : null;
}
