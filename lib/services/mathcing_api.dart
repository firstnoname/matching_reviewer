import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/based_api.dart';

class MatchingAPI extends BasedAPI {
  static const collectionName = "matching";
  static MatchingAPI? _cache;

  factory MatchingAPI() {
    _cache ??= MatchingAPI._();
    return _cache!;
  }

  MatchingAPI._() : super(collectionName: collectionName);

  Future<bool> addMatching(
      {required User reviewer,
      required User entrepreneur,
      required String category,
      required String subCategory}) async {

    Matching matching = Matching(
        entrepreneur: entrepreneur,
        reviewer: reviewer,
        productExpertiseCategory: category,
        productExpertiseSubCategory: subCategory);

    var response = await collection.add(matching.toMap());

    print('response -> ${response}');

    return false;
  }
}
