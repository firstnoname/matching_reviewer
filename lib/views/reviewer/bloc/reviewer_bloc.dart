import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:meta/meta.dart';

import '../../../services/services.dart';
import '../../../utilities/constants.dart';

part 'reviewer_event.dart';

part 'reviewer_state.dart';

class ReviewerBloc extends Bloc<ReviewerEvent, ReviewerState> {
  List<Matching> _products = [];

  ReviewerBloc() : super(ReviewerInitial()) {
    on<ReviewerEventGetProduct>(_onGetProduct);
    on<ReviewerEventUploadFile>(_onUploadFile);
  }

  FutureOr<void> _onGetProduct(
      ReviewerEventGetProduct event, Emitter<ReviewerState> emit) async {
    _products = await MatchingAPI()
        .getMatchingListByReviewerId(userId: event.reviewerId);

    emit(ReviewerStateGetProductSuccess(products: _products));
  }

  Future<FutureOr<void>> _onUploadFile(
      ReviewerEventUploadFile event, Emitter<ReviewerState> emit) async {
    var filePath = await FileApi().uploadFile(
        event.pickedFile.files.single.bytes!,
        '$productPathOnFireStore/${event.matchingID}/$filePathOnFireStore/${event.pickedFile.names.first}');
    if (filePath != null) {
      debugPrint('file path -> $filePath');
      Matching _selectedProduct =
          _products.firstWhere((product) => product.id == event.matchingID);
      _selectedProduct.product?.reviewedFormPath = filePath;
      var isUpdateSuccess = await MatchingAPI()
          .updateMatchingReviewedForm(matchingInfo: _selectedProduct);
      if (isUpdateSuccess == true) {
        _products[_products.indexWhere(
            (element) => element.id == _selectedProduct.id)] = _selectedProduct;
        emit(ReviewerStateGetProductSuccess(products: _products));
      } else {
        emit(ReviewerStateFailure());
      }
    }
  }
}
