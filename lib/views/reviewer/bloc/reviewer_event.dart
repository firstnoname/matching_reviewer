part of 'reviewer_bloc.dart';

@immutable
abstract class ReviewerEvent {}

class ReviewerEventInit extends ReviewerEvent {}

class ReviewerEventGetProduct extends ReviewerEvent {
  final String reviewerId;

  ReviewerEventGetProduct({required this.reviewerId});
}

class ReviewerEventUploadFile extends ReviewerEvent {
  final String matchingID;
  final FilePickerResult pickedFile;

  ReviewerEventUploadFile({required this.matchingID, required this.pickedFile});
}
