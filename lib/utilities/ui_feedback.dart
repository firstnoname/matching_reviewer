import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UIFeedback {
  final BuildContext _context;

  UIFeedback(this._context);

  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    var transitionBuilder = EasyLoading.init(builder: builder);
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.circle;
    return transitionBuilder;
  }

  static Future<void> showLoadingIndicator() {
    return EasyLoading.show(
        status: "Loading...", maskType: EasyLoadingMaskType.black);
  }

  static Future<void> dismiss() {
    return EasyLoading.dismiss();
  }
}
